import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../reset_password/bloc/reset_password_bloc.dart';
import '../../validators/validators.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/custom_theme.dart';
import '../../widgets/unsecured_textfield.dart';

class EmailForResetPasswordWidget extends StatefulWidget {
  const EmailForResetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EmailForResetPasswordWidgetState();
}

class EmailForResetPasswordWidgetState
    extends State<EmailForResetPasswordWidget> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 36.h, children: [
      UnsecuredTextField(
          validator: (text) => Validators().validatePassword(text),
          controller: _emailController,
          nameField: "Email or username",
          onChanged: (String str) {}),
      BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is EmailFailedState) {}
          if (state is EmailSuccessState) {
            Navigator.pushNamed(context, '/verification');
          }
        },
        child: MainButtonDark(
            name: "Reset my password",
            onPressed: () {
              context.read<ResetPasswordBloc>().add(
                  EmailForResetSubmitted(email: _emailController.text.trim()));
            }),
      ),
    ]);
  }
}
