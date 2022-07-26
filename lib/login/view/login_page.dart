import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/widgets/main_button.dart';
import '../../widgets/appbar.dart';
import '../../widgets/forgot_password_button.dart';
import '../bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
              width: 170,
              height: 170,
              child: Image.asset("assets/images/logo.png")),
          BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              );
            },
            child: const LoginForm(),
          ),
          const Align(
              alignment: Alignment.bottomLeft, child: ForgotPasswordButton()),
          MainButtonLight(name: "LogIn", onPressed: () {})
        ]),
      ),
    );
  }
}
