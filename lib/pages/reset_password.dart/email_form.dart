import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../reset_password/bloc/reset_password_bloc.dart';
import '../../widgets/buttons/main_button.dart';
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
    return Column(children: [
      UnsecuredTextField(
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
