import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: purple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          toolbarHeight: 34.h,
          color: purple,
          elevation: 0,
        ));
  }
}
