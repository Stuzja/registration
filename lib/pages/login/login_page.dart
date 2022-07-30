import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/pages/login/login_form.dart';
import '../../../widgets/appbar.dart';
import '../../login/bloc/login_bloc.dart';
import '../../repositories/login_repository.dart';
import '../../widgets/buttons/text_button.dart';
import '../../widgets/custom_theme.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          SizedBox(
              width: 170.w,
              height: 170.h,
              child: Image.asset("assets/images/logo.png")),
          BlocProvider(
            create: (context) {
              return LoginBloc(repository: LoginRepository());
            },
            child: const LoginFormWidget(),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Don’t have an account?",
                style: CustomTheme.lightTheme.textTheme.bodyText1),
            RegularTextButton(
                name: "Sign up",
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                }),
          ]),
        ]),
      ),
    );
  }
}
