import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/buttons/back_button.dart';
import '../widgets/secured_textfield.dart';
import '../widgets/unsecured_textfield.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

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
            MainButtonDark(name: "Register", onPressed: (() {}))
          ]),
        ]),
      ),
    );
  }
}
