import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../../widgets/buttons/text_button.dart';
import '../bloc/login_bloc.dart';
import 'login_form.dart';

/*class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

 /* static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
              width: 170.w,
              height: 170.h,
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
*/