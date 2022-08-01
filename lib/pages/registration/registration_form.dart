import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../registration/bloc/registration_bloc.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/secured_textfield.dart';
import '../../widgets/unsecured_textfield.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegistrationFormWidgetState();
}

class RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 24.h, children: [
      UnsecuredTextField(
        onChanged: (String str) {},
        errorText: null,
        nameField: "Username",
      ),
      UnsecuredTextField(
        controller: _emailController,
        onChanged: (String str) {},
        errorText: null,
        nameField: "Email",
      ),
      SecuredTextField(
        controller: _passwordController,
        onChanged: (String str) {},
        nameField: 'Password',
        errorText: null,
      ),
      SecuredTextField(
        onChanged: (String str) {},
        nameField: 'Confirm password',
        errorText: null,
      ),
      BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationFailedState) {}
          if (state is RegistrationSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: MainButtonDark(
            name: "Register",
            onPressed: () {
              context.read<RegistrationBloc>().add(RegistrationSubmitted(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim()));
            }),
      ),
    ]);
  }
}
