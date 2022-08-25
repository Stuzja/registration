import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../blocs/registration/bloc/registration_bloc.dart';
import '../../../resources/validators/validators.dart';
import '../../common_widgets/buttons/main_button.dart';
import '../../common_widgets/textfields/secured_textfield.dart';
import '../../common_widgets/textfields/unsecured_textfield.dart';


class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegistrationFormWidgetState();
}

class RegistrationFormWidgetState extends State<RegistrationFormWidget> {
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
          child: UnsecuredTextField(
            controller: _usernameController,
            validator: (text) => Validators().validateUsername(text),
            onChanged: (String str) {},
            errorText: null,
            nameField: "Username",
          )),
      Form(
        key: _formKeyEmail,
        child: UnsecuredTextField(
          validator: (text) => Validators().validateEmail(text),
          controller: _emailController,
          onChanged: (String str) {},
          errorText: null,
          nameField: "Email",
        ),
      ),
      Form(
        key: _formKeyPassword,
        child: SecuredTextField(
          validator: (text) => Validators().validatePassword(text),
          controller: _passwordController,
          onChanged: (String str) {},
          nameField: 'Password',
          errorText: null,
        ),
      ),
      Form(
        key: _formKeyPasswordAgain,
        child: SecuredTextField(
          validator: (text) {
            if (_passwordController.text == text) {
              return Validators().validatePassword(text);
            } else {
              return "Passwords don't match";
            }
          },
          onChanged: (String str) {},
          controller: _passwordAgainController,
          nameField: 'Confirm password',
        ),
      ),
      BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationLoadingState) {
            Navigator.pushNamed(context, '/splash');
          }
          if (state is RegistrationFailedState) {}
          if (state is RegistrationSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: MainButtonDark(
            name: "Register",
            onPressed: () {
              if (_formKeyUsername.currentState!.validate() &
                  _formKeyPassword.currentState!.validate() &
                  _formKeyEmail.currentState!.validate() &
                  _formKeyPasswordAgain.currentState!.validate()) {
                context.read<RegistrationBloc>().add(RegistrationSubmitted(
                    username: _usernameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim()));
              }
            }),
      ),
    ]);
  }
}