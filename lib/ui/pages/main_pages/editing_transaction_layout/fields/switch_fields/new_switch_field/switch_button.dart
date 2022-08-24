import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/resources/theme/custom_theme.dart';

class SwitchButton extends StatelessWidget {
  final String title;
  final bool isPicked;
  final void Function(Object)? onTap;
  const SwitchButton(
      {Key? key, required this.title, required this.isPicked, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164.w,
      height: 64.h,
      child: GestureDetector(
   //     onTap: onTap(isPicked),
        child: Container(
          decoration: BoxDecoration(
              color:
                  isPicked ? ColorClass.purple.withOpacity(0.5) : Colors.white,
              border: Border.all(
                color: ColorClass.purple,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(title,
                style: CustomTheme.lightTheme.textTheme.labelMedium
                    ?.copyWith(color: ColorClass.purple)),
          ),
        ),
      ),
    );
  }
}
