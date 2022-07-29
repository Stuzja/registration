import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/buttons/text_button.dart';
import '../widgets/custom_theme.dart';
import '../widgets/secured_textfield.dart';
import '../widgets/unsecured_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          SizedBox(
              width: 170.w,
              height: 170.h,
              child: Image.asset("assets/images/logo.png")),
          UnsecuredTextField(
            controller: emailController,
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (String str) {},
            errorText: null,
            nameField: "Username",
          ),
          SecuredTextField(
            controller: passwordController,
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (String str) {},
            nameField: 'Password',
            errorText: null,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: RegularTextButton(
                  name: "Forgot password?",
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgotPassword');
                  })),
          MainButtonLight(
              name: "Login",
              onPressed: () {
                signIn();
              }),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Don’t have an account?",
                style: CustomTheme.lightTheme.textTheme.bodyText1),
            RegularTextButton(
                name: "Sign up",
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                }),
          ]),
        ]),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
