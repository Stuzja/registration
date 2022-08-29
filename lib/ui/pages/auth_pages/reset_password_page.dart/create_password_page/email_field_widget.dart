import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/auth/bloc/auth_bloc.dart';
import 'package:registration/resources/validators/validators.dart';
import 'package:registration/ui/common_widgets/buttons/main_button.dart';
import 'package:registration/ui/common_widgets/textfields/auth_textfield.dart';

class EmailForResetPasswordWidget extends StatefulWidget {
  const EmailForResetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EmailForResetPasswordWidgetState();
}

class EmailForResetPasswordWidgetState
    extends State<EmailForResetPasswordWidget> {
  final _emailController = TextEditingController();
  final _formKeyEmail = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 36.h, children: [
      Form(
        key: _formKeyEmail,
        child: SecuredTextField(
            isSecured: false,
            validator: (text) => Validators().validatePassword(text),
            controller: _emailController,
            nameField: "Email or username",
            onChanged: (String str) {}),
      ),
      BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is EmailFailedState) {}
          if (state is EmailSuccessState) {
            Navigator.pushNamed(context, '/verification');
          }
        },
        child: MainButton(
            isLight: false,
            name: "Reset my password",
            onPressed: () {
              if (_formKeyEmail.currentState!.validate()) {
                context.read<AuthBloc>().add(EmailForResetSubmitted(
                    email: _emailController.text.trim()));
              }
            }),
      ),
    ]);
  }
}
