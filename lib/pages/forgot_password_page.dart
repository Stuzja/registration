import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/custom_theme.dart';
import '../widgets/unsecured_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Forgot Your Password?",
              style: CustomTheme.lightTheme.textTheme.headline1),
          Text(
              "No worries, you just need to type your phone number or username and we will send the verification code",
              style: CustomTheme.lightTheme.textTheme.bodyText1),
          UnsecuredTextField(
              nameField: "Phone number or username",
              onChanged: (String str) {}),
          MainButtonDark(name: "Reset my password", onPressed: () {Navigator.pushNamed(context, '/verification');}),
        ]),
      ),
    );
  }
}
