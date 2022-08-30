import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:registration/repositories/abstract_auth_repository.dart';
import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../resources/validators/validators.dart';

class AuthenticationRepository extends AbstractAuthRepository {
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
  Future<String> checkInEmail({required String username}) async {
    var snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(username)
        .get();
    return await snap.get('email');
  }

  Future<String> checkInUsername({required String email}) async {
    var snap =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    return await snap.get('userName');
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    bool statusLogged = false;
    if (Validators().validateEmail(email) == null) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        thisUser.email = email;
        thisUser.password = password;
        thisUser.username = await checkInUsername(email: email);
        statusLogged = true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      String newEmail = await checkInEmail(username: email);
      statusLogged = await signIn(email: newEmail, password: password);
    }
    return statusLogged;
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    bool success = false;
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(username);
    final docEmail = FirebaseFirestore.instance.collection('users').doc(email);
    final userToJson = UserModel(
      username: username,
      password: password,
      email: email,
    ).toJson();

    try {
      docUser.set(userToJson);
      docEmail.set(userToJson);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      thisUser =
          UserModel(email: email, password: password, username: username);
      success = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    return success;
  }

  @override
  Future<bool> signOut() async {
    try {
      FirebaseAuth.instance.signOut();
      thisUser = UserModel(username: "", email: "", password: "");
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;

  @override
  Future<bool> signInGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    bool isSuccess = false;
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    isSuccess = true;

    return isSuccess;
  }

  @override
  Future<void> signOutGoogle() async {
    googleSignIn.disconnect();
  }
}
