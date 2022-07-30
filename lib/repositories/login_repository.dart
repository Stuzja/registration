import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration/login/models/models.dart';

class LoginRepository {
  Future signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
