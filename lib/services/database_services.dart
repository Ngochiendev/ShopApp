import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String fullname, String email, String photo) async {
    return await usersCollection.doc(uid).set({
      "fullname": fullname,
      "email": email,
      "uid": uid,
      "ProfilePic": photo,
    });
  }
}
