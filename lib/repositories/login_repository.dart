import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration/repositories/abstract_repository.dart';
import '../models/user_model.dart';

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
}
