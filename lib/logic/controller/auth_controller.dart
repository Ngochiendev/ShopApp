import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopapp/Models/facebook_models.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/services/database_services.dart';

class Authcontroller extends GetxController {
  bool isVisibilty = false;
  bool isCheckbox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  FacebookModels? facebookmodel;
  var isSignIn = false;
  final GetStorage authbox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    displayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL : "")!;
    displayEmail.value = (userProfile != null ? userProfile!.email : "")!;

    super.onInit();
  }

  Future<void> Visibilty() async {
    isVisibilty = !isVisibilty;
    update();
  }

  Future<void> Checkbox() async {
    isCheckbox = !isCheckbox;
    update();
  }

  // SIGN UP
  Future<void> signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      // await auth
      //     .createUserWithEmailAndPassword(email: email, password: password)
      //     .then((value) => {
      //           displayUserName.value = name,
      //           auth.currentUser!.updateDisplayName(name)
      //         });
      User user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      //update profile with Cloud FireStore
      await DatabaseServices(uid: user.uid).updateUserData(name, email, '');
      update();
      Get.snackbar(
        '',
        'Sign Up Success!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.offAllNamed("/mainScreen");
        },
      );
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code.replaceAll(RegExp('_'), '').capitalize!;
      if (error.code == 'weak-password') {
        message = 'Provided Password is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'Account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  // LOGIN
  Future<void> logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSignIn = true;
      authbox.write('auth', isSignIn);
      update();
      Get.offNamed('/mainScreen');
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code.replaceAll(RegExp('_'), '').capitalize!;
      if (error.code == 'user-not-found') {
        message =
            'Account doesn\t exists for that $email.. Create your account by signing up...!';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password... Please try again!';
      } else {
        error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //Login with google
  Future<void> googleSignInApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayEmail.value = googleUser.email;
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      isSignIn = true;
      authbox.write('auth', isSignIn);

      //update profile with Cloud FireStore
      await DatabaseServices(uid: googleUser.id).updateUserData(
          displayUserName.value, displayEmail.value, displayUserPhoto.value);

      update();
      Get.offNamed('/mainScreen');
    } on FirebaseAuthException catch (error) {
      print(error.message);
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
    // try {
    //   final GoogleSignInAccount? googleSignInAccount =
    //       await GoogleSignIn().signIn();
    //   if (googleSignInAccount != null) {
    //     final GoogleSignInAuthentication googleSignInAuthentication =
    //         await googleSignInAccount.authentication;
    //     final AuthCredential authCredential = GoogleAuthProvider.credential(
    //         accessToken: googleSignInAuthentication.accessToken,
    //         idToken: googleSignInAuthentication.idToken);
    //     await auth.signInWithCredential(authCredential);
    //   }
    //   displayUserName = googleSignInAccount!.displayName!;
    //   displayUserPhoto = googleSignInAccount.photoUrl!;
    //   update();
    //   Get.offNamed('/mainScreen');
    // } on FirebaseAuthException catch (e) {
    //   print(e.message);
    //   rethrow;
    // }
  }

  //Login with facebook
  Future<void> facebookSignInApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await auth.signInWithCredential(facebookAuthCredential);
      if (loginResult.status == LoginStatus.success) {
        final data = await FacebookAuth.instance.getUserData();
        facebookmodel = FacebookModels.fromJson(data);
        isSignIn = true;
        authbox.write('auth', isSignIn);
        update();
        Get.offNamed('mainScreen');
      }
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //reset password
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Fluttertoast.showToast(
          msg: "Please, Check your email for a reset password email",
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 2,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          fontSize: 16.0);
      Future.delayed(
        const Duration(seconds: 4),
        () {
          Get.back();
        },
      );
    } on FirebaseAuthException catch (error) {
      String message = '';
      String title = error.code.replaceAll(RegExp('_'), '').capitalize!;
      if (error.code == 'user-not-found') {
        message =
            'Account doesn\t exists for that $email.. Create your account by signing up...!';
      } else {
        error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //Singout
  Future<void> signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayEmail.value = '';
      isSignIn = false;
      authbox.remove('auth');
      update();
      Get.offNamed(PageRoutes.signin_signupScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}

//GetxBuilder

//Obx
