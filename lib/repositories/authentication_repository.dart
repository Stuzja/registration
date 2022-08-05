import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration/repositories/abstract_repository.dart';
import '../models/user_json_model.dart';
import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/validators/validators.dart';

class AuthenticationRepository extends AbstractRepository {
  @override
  Future<UserModel> resetPassword({required String email}) async {
    var user = UserModel(email: email, password: "");
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      user.emailSent = true;
    } on FirebaseAuth catch (e) {
      print(e);
    }
    return user;
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
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    UserModel user = UserModel(email: email, password: password);
    if (Validators().validateEmail(email) == null) {
      try {
        UserCredential user_credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        user.statusLogged = StateUserLogged.isLogged;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      String newEmail = await checkIn(username: email);
      user = await signIn(email: newEmail, password: password);
    }
    return user;
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
    final userToJson = UserJsonModel(
      password: password,
      login: email,
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
