import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/constants/colors.dart';
import '../../resources/theme/custom_theme.dart';

class FaceIdSwitcher extends StatefulWidget {
  const FaceIdSwitcher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FaceIdSwitcherState();
}

class FaceIdSwitcherState extends State<FaceIdSwitcher> {
  bool faceId = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      margin: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorClass.greyLight,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: ListTile(
          leading: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: ColorClass.purple,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.sentiment_satisfied_alt,
              color: Colors.white,
            ),
          ),
          title: Text('Face ID',
              style: CustomTheme.lightTheme.textTheme.headline2
                  ?.copyWith(color: Colors.black, fontSize: 17)),
          trailing: CupertinoSwitch(
              activeColor: ColorClass.purple,
              value: faceId,
              onChanged: (value) {
                setState(() {
                  faceId = value;
                });
              }),
        ),
      ),
    );
  }
}
