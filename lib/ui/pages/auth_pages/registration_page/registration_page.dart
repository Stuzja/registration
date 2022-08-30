import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/auth/bloc/auth_bloc.dart';
import 'package:registration/repositories/authentication_repository.dart';
import 'package:registration/resources/constants/path_images.dart';
import 'package:registration/ui/common_widgets/appbar.dart';
import 'package:registration/ui/common_widgets/buttons/back_button.dart';

import 'registration_fields_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 36.h, 62.h),
        child: ListView(children: [
          const CustomBackButton(),
          SizedBox(width: 170.w, height: 170.h, child: Image.asset(logoMobyte)),
          Padding(
            padding: const EdgeInsets.only(top: 27),
            child: BlocProvider(
              create: (context) {
                return AuthBloc(repository: AuthenticationRepository());
              },
              child: const RegistrationFieldsWidget(),
            ),
          ),
        ]),
      ),
    );
  }
}
