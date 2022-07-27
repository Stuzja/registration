import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/buttons/text_button.dart';
import '../widgets/custom_theme.dart';
import '../widgets/secured_textfield.dart';
import '../widgets/unsecured_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

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
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (String str) {},
            errorText: null,
            nameField: "Username",
          ),
          SecuredTextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (String str) {},
            nameField: 'Password',
            errorText: null,
          ),
          RegularTextButton(name: "Forgot password?", onPressed: () {}),
          MainButtonLight(name: "Login", onPressed: () {}),
          Row(children: [
            Text("Don’t have an account?",
                style: CustomTheme.lightTheme.textTheme.bodyText1),
            Center(
              child: RegularTextButton(name: "Sign up", onPressed: () {}),
            )
          ]),
        ]),
      ),
    );
  }
}
