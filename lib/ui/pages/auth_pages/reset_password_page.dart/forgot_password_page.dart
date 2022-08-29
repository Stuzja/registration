import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/auth/bloc/auth_bloc.dart';
import 'package:registration/repositories/authentication_repository.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:registration/ui/common_widgets/appbar.dart';
import 'package:registration/ui/common_widgets/buttons/back_button.dart';

import 'create_password_page/email_field_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 36.h, left: 16.w, right: 16.w),
        child: ListView(children: [
          const CustomBackButton(),
          Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 36.h,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Forgot Your Password?",
                      style: CustomTheme.lightTheme.textTheme.headline1),
                  Text(
                      "No worries, you just need to type your email or username and we will send the verification code",
                      style: CustomTheme.lightTheme.textTheme.bodyText1),
                ]),
                BlocProvider(
                  create: (context) {
                    return AuthBloc(repository: AuthenticationRepository());
                  },
                  child: const EmailForResetPasswordWidget(),
                ),
              ]),
        ]),
      ),
    );
  }
}
