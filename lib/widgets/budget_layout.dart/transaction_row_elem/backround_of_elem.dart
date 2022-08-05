import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'circle_painter.dart';

class ShadedCard extends StatelessWidget {
  final Color mainColor;
  final Color shadeColor1;
  final Color shadeColor2;
  const ShadedCard({super.key, required this.mainColor, required this.shadeColor1, required this.shadeColor2});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [shadeColor1, shadeColor2]
          ),
        ),
        height: 12.5.h,
        width: 40.w,
        child: CustomPaint(
          painter: CirclePainter(mainColor),
        ),
      ),
    );
  }

}