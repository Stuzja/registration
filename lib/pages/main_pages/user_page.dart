import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/face_id_button.dart';
import 'package:registration/widgets/buttons/logout_text_button.dart';
import '../../blocs/login/bloc/login_bloc.dart';
import '../../models/user_model.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/login_google_repository.dart';
import '../../resources/constants/path_images.dart';
import '../../resources/theme/custom_theme.dart';
import '../../widgets/buttons/floating_bar_button.dart';
import '../../widgets/navigation_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtonBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const FloatingNavigationBar(
        currentIndex: 3,
      ),
      body: Column(
        children: [
          SizedBox(width: 150.w, height: 150.h, child: Image.asset(logoMobyte)),
          Text(thisUser.email!,
              style: CustomTheme.lightTheme.textTheme.headline1),
          Text(thisUser.username!,
              style: CustomTheme.lightTheme.textTheme.headline1),
          const FaceIdSwitcher(),
          BlocProvider(
            create: (context) {
              return LoginBloc(
                  repository: AuthenticationRepository(),
                  loginGoogle: LoginGoogleRepository());
            },
            child: const LogoutButton(),
          ),
        ],
      ),
    );
  }
}
