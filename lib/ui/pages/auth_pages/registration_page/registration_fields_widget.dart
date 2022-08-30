import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/auth/bloc/auth_bloc.dart';
import 'package:registration/resources/validators/validators.dart';
import 'package:registration/ui/common_widgets/buttons/main_button.dart';
import 'package:registration/ui/common_widgets/textfields/auth_textfield.dart';

class RegistrationFieldsWidget extends StatefulWidget {
  const RegistrationFieldsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegistrationFieldsWidgetState();
}

class RegistrationFieldsWidgetState extends State<RegistrationFieldsWidget> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final _formKeyUsername = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyPasswordAgain = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 24.h, children: [
      Form(
          key: _formKeyUsername,
          child: AuthTextField(
            isSecured: false,
            controller: _usernameController,
            validator: (text) => Validators().validateUsername(text),
            errorText: null,
            nameField: "Username",
          )),
      Form(
        key: _formKeyEmail,
        child: AuthTextField(
          isSecured: false,
          validator: (text) => Validators().validateEmail(text),
          controller: _emailController,
          errorText: null,
          nameField: "Email",
        ),
      ),
      Form(
        key: _formKeyPassword,
        child: AuthTextField(
          isSecured: true,
          validator: (text) => Validators().validatePassword(text),
          controller: _passwordController,
          nameField: 'Password',
          errorText: null,
        ),
      ),
      Form(
        key: _formKeyPasswordAgain,
        child: AuthTextField(
          isSecured: true,
          validator: (text) {
            if (_passwordController.text == text) {
              return Validators().validatePassword(text);
            } else {
              return "Passwords don't match";
            }
          },
          controller: _passwordAgainController,
          nameField: 'Confirm password',
        ),
      ),
      BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegistrationLoadingState) {
            Navigator.pushNamed(context, '/splash');
          }
          if (state is RegistrationSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: MainButton(
            isLight: false,
            name: "Register",
            onPressed: () {
              if (_formKeyUsername.currentState!.validate() &
                  _formKeyPassword.currentState!.validate() &
                  _formKeyEmail.currentState!.validate() &
                  _formKeyPasswordAgain.currentState!.validate()) {
                context.read<AuthBloc>().add(RegistrationSubmitted(
                    username: _usernameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim()));
              }
            }),
      ),
    ]);
  }
}
