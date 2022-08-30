import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/auth/bloc/auth_bloc.dart';
import 'package:registration/resources/validators/validators.dart';
import 'package:registration/ui/common_widgets/buttons/main_button.dart';
import 'package:registration/ui/common_widgets/buttons/text_button.dart';
import 'package:registration/ui/common_widgets/textfields/auth_textfield.dart';

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
    return Wrap(
      spacing: 24.h,
      children: [
        Form(
          key: _formKeyUsername,
          child: AuthTextField(
            isSecured: false,
            validator: (text) => Validators().validateUsername(text),
            controller: _emailController,
            onChanged: (String str) {},
            errorText: null,
            nameField: "Username",
          ),
        ),
        Form(
          key: _formKeyPassword,
          child: AuthTextField(
            isSecured: true,
            validator: (text) => Validators().validatePassword(text),
            controller: _passwordController,
            onChanged: (String str) {},
            nameField: 'Password',
            errorText: null,
          ),
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
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              Navigator.pushNamed(context, '/splash');
            }
            if (state is LoginFailedState) {
              final snackBar = SnackBar(
                content: const Text(
                    'The password does not match or there is no such user'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushNamed(context, '/login');
            }
            if (state is LoginSuccessState) {
              Navigator.pushNamed(context, '/home');
            }
          },
          child: MainButton(
              isLight: true,
              name: "Login",
              onPressed: () {
                if (_formKeyUsername.currentState!.validate() &
                    _formKeyPassword.currentState!.validate()) {
                  context.read<AuthBloc>().add(LoginSubmitted(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim()));
                }
              }),
        ),
      ],
    );
  }
}
