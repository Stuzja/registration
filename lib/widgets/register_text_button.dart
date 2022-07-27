import 'package:flutter/material.dart';
import 'package:registration/widgets/colors.dart';
import '../pages/registration_page.dart';
import 'custom_theme.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("Don’t have an account?",
          style: CustomTheme.lightTheme.textTheme.bodyText1),
      TextButton(
        child: Text("Sign up",
            style: CustomTheme.lightTheme.textTheme.bodyText1
                ?.copyWith(color: purple)),
        onPressed: () => RegistrationPage.route(),
      )
    ]);
  }
}
