import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/buttons/text_button.dart';
import '../widgets/custom_theme.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const VerificationCodePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Enter Verification Code",
              style: CustomTheme.lightTheme.textTheme.headline1),
          Text("Enter code that we have sent to your phone +7 (***) ***-**-14",
              style: CustomTheme.lightTheme.textTheme.bodyText1),
          MainButtonDark(name: "Verify", onPressed: () {}),
          Center(
              child: RegularTextButton(onPressed: () {}, name: "Resend Code")),
        ]),
      ),
    );
  }
}
