import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration/repositories/abstract_repository.dart';
import '../models/user_json_model.dart';
import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRepository extends AbstractRepository {
  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    UserModel user = UserModel(email: email, password: password);
    try {
      UserCredential user_credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (user_credential.user != null) {
        user.statusLogged = StateUserLogged.isLogged;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<UserModel> signUp(
      {required String email, required String password}) async {
    UserModel user = UserModel(email: email, password: password);
    try {
      var user_credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (user_credential.user != null) {
        user.statusRegistered = StateUserRegistered.isRegistered;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return user;
  }

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
  Future<UserModel> signInUser(
      {required String email, required String password}) async {
    UserModel user = UserModel(email: email, password: password);
    try {
      UserCredential user_credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        String newEmail = await checkIn(username: email);
        signInUser(email: newEmail, password: password);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    user.statusLogged = StateUserLogged.isLogged;
    return user;
  }

  Future<UserModel> signUpUser({
    required String email,
    required String password,
    required String userName,
  }) async {
    UserModel user =
        UserModel(email: email, password: password, username: userName);
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(userName);
    final userToJson = UserJsonModel(
      password: password,
      login: email,
    );
    final json = userToJson.toJson();

    try {
      docUser.set(json);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    user.statusRegistered = StateUserRegistered.isRegistered;

    return user;
  }
}
