import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../login/bloc/login_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(spacing: 24.h, children: [
          UnsecuredTextField(
            controller: _emailController,
            onChanged: (String str) {},
            errorText: null,
            nameField: "Username",
          ),
          Column(children: [
            SecuredTextField(
              controller: _passwordController,
              onChanged: (String str) {},
              nameField: 'Password',
              errorText: null,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 19,
                child: RegularTextButton(
                  name: "Forgot password?",
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgotPassword');
                  },
                ),
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
