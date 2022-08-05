import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration/repositories/abstract_repository.dart';
import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/validators/validators.dart';

class AuthenticationRepository extends AbstractRepository {
  @override
  Future<bool> resetPassword({required String email}) async {
    var emailSent = false;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emailSent = true;
    } on FirebaseAuth catch (e) {
      print(e);
    }
    return emailSent;
  }

  @override
  Future<String> checkIn({required String username}) async {
    var snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(username)
        .get();
    return await snap.get('email');
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    bool statusLogged = false;
    if (Validators().validateEmail(email) == null) {
      try {
        UserCredential user_credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        statusLogged = true;

      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      String newEmail = await checkIn(username: email);
      statusLogged = await signIn(email: newEmail, password: password);
    }
    return statusLogged;
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    UserModel user =
        UserModel(email: email, password: password, username: userName);
    bool success = false;
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(userName);
    final userToJson = UserModel(
      password: password,
      email: email,
    ).toJson();

    try {
      docUser.set(userToJson);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    success = true;

    return success;
  }
}
