import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/authentication_repository.dart';
import 'package:registration/repositories/login_google_repository.dart';
import 'package:registration/ui/common_widgets/appbar.dart';
import 'package:registration/ui/common_widgets/buttons/text_button.dart';

import '../../../blocs/login/bloc/login_bloc.dart';
import '../../../resources/constants/path_images.dart';
import '../../../resources/theme/custom_theme.dart';
import 'login_form.dart';
import 'login_google_form.dart';
import 'login_page_divider.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              repository: AuthenticationRepository(),
              loginGoogle: LoginGoogleRepository());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(children: [
            SizedBox(
                width: 170.w, height: 170.h, child: Image.asset(logoMobyte)),
            const LoginFormWidget(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don’t have an account?",
                  style: CustomTheme.lightTheme.textTheme.bodyText1),
              RegularTextButton(
                  name: "Sign up",
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  }),
            ]),
            const CustomDivider(),
            const LoginGoogleWidget()
          ]),
        ),
      ),
    );
  }
}
