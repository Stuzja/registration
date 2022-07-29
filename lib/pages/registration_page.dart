import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/buttons/back_button.dart';
import '../widgets/secured_textfield.dart';
import '../widgets/unsecured_textfield.dart';
import 'home_page.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegistrationPage());
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          const CustomBackButton(),
          SizedBox(
              width: 170.w,
              height: 170.h,
              child: Image.asset("assets/images/logo.png")),
          Wrap(runSpacing: 24.h, children: [
            UnsecuredTextField(
              controller: emailController,
              key: const Key('loginForm_usernameInput_textField'),
              onChanged: (String str) {},
              errorText: null,
              nameField: "Username",
            ),
            UnsecuredTextField(
              onChanged: (String str) {},
              errorText: null,
              nameField: "Phone number",
            ),
            SecuredTextField(
              controller: passwordController,
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (String str) {},
              nameField: 'Password',
              errorText: null,
            ),
            SecuredTextField(
              onChanged: (String str) {},
              nameField: 'Confirm password',
              errorText: null,
            ),
            MainButtonDark(
                name: "Register",
                onPressed: (() {
                  signUp();
                  const HomePage();
                }))
          ]),
        ]),
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
