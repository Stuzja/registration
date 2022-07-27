import 'package:flutter/material.dart';
import 'package:registration/widgets/colors.dart';
import 'custom_theme.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Forgot Password?",
          style: CustomTheme.lightTheme.textTheme.bodyText1
              ?.copyWith(color: purple)),
      onPressed: () {},
    );
  }
}
