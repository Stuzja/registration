import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'resources/router.dart';
import 'ui/pages/auth_pages/login_page/login_page.dart';


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
            home: const LoginPage(),
            onGenerateRoute: generateRoute,
          );
        });
  }
}
