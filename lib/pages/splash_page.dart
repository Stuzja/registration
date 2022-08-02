import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

      child: Column(children: [SizedBox(
          width: 250.w,
          height: 250.h,
          child: Image.asset("assets/images/logo.png")),
          const CircularProgressIndicator(),
      ]),
    ));
  }
}
