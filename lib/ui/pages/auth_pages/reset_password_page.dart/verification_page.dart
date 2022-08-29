import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:registration/ui/common_widgets/appbar.dart';
import 'package:registration/ui/common_widgets/buttons/back_button.dart';
import 'package:registration/ui/common_widgets/buttons/main_button.dart';
import 'package:registration/ui/common_widgets/buttons/text_button.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomBackButton(),
          Text("Enter Verification Code",
              style: CustomTheme.lightTheme.textTheme.headline1),
          Text(
              "Enter code that we have sent to your email yon*******@gmail.com",
              style: CustomTheme.lightTheme.textTheme.bodyText1),
          MainButton(
              isLight: true,
              name: "Verify",
              onPressed: () {
                Navigator.pushNamed(context, '/createPassword');
              }),
          Center(
              child: RegularTextButton(onPressed: () {}, name: "Resend Code")),
        ]),
      ),
    );
  }
}
