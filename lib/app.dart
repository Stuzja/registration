import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/pages/create_password_page.dart';
import 'package:registration/pages/forgot_password_page.dart';
import 'package:registration/pages/login/login_page.dart';
import 'package:registration/pages/main_page.dart';
import 'package:registration/pages/registration/registration_page.dart';
import 'package:registration/pages/splash_page.dart';
import 'package:registration/pages/verification_page.dart';
import 'package:registration/widgets/custom_theme.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: CustomTheme.lightTheme,
            routes: {
              '/login': (BuildContext context) => const LoginPage(),
              '/register': (BuildContext context) => const RegistrationPage(),
              '/forgotPassword': (BuildContext context) => ForgotPasswordPage(),
              '/verification': (BuildContext context) =>
                  const VerificationPage(),
              '/createPassword': (BuildContext context) =>
                  const CreatePasswordPage(),
              '/home': (BuildContext context) => const HomePage(),
            },
            home: const MainPage(),
            onGenerateRoute: (_) => SplashPage.route(),
          );
        });
  }
}
