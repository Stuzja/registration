import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/theme/custom_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '  or  ',
              style: CustomTheme.lightTheme.textTheme.bodyText1,
            ),
          ),
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          )
        ],
      ),
    );
  }
}
