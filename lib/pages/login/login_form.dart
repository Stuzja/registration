import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../login/bloc/login_bloc.dart';
import '../../validators/validators.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/buttons/text_button.dart';
import '../../widgets/secured_textfield.dart';
import '../../widgets/unsecured_textfield.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKeyUsername = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(spacing: 24.h, children: [
          UnsecuredTextField(
            key: _formKeyUsername,
            validator: (text) => Validators().validateUsername(text),
            controller: _emailController,
            onChanged: (String str) {},
            errorText: null,
            nameField: "Username",
          ),
          Column(children: [
            SecuredTextField(
              key: _formKeyPassword,
              validator: (text) => Validators().validatePassword(text),
              controller: _passwordController,
              onChanged: (String str) {},
              nameField: 'Password',
              errorText: null,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RegularTextButton(
                name: "Forgot password?",
                onPressed: () {
                  Navigator.pushNamed(context, '/forgotPassword');
                },
              ),
            ),
          ]),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailedState) {}
              if (state is LoginSuccessState) {
                Navigator.pushNamed(context, '/home');
              }
            },
            child: MainButtonLight(
                name: "Login",
                onPressed: () {
                  /*    if (_formKeyUsername.currentState!.validate() &
                      _formKeyPassword.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    context.read<LoginBloc>().add(LoginSubmitted(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim()));
                  }*/
                  context.read<LoginBloc>().add(LoginSubmitted(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim()));
                }),
          ),
        ]),
      ],
    );
  }
}
