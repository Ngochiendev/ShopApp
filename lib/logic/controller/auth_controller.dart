import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  bool isVisibilty = false;
  bool isCheckbox = false;
  var displayUserName = '';
  FirebaseAuth auth = FirebaseAuth.instance;

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
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                displayUserName = name,
                auth.currentUser!.updateDisplayName(name)
              });
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
          .then((value) => displayUserName = auth.currentUser!.displayName!);
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

  Future<void> googleSignUpApp() async {}
  Future<void> facebookSignUpApp() async {}

  Future<void> resetPassword() async {}
  Future<void> signOutFromApp() async {}
}

//GetxBuilder

//Obx
