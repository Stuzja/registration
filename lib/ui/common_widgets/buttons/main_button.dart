import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/resources/theme/custom_theme.dart';

class MainButton extends StatelessWidget {
  final bool isLight;
  final String name;
  final void Function()? onPressed;

  const MainButton(
      {Key? key,
      required this.name,
      required this.onPressed,
      required this.isLight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: isLight ? Colors.white : ColorClass.purple,
        minimumSize: Size(328.w, 53.h),
      ),
      child: Text(name,
          style: CustomTheme.lightTheme.textTheme.button
              ?.copyWith(color: isLight ? ColorClass.purple : Colors.white)),
    );
  }
}
