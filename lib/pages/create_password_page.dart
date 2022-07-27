import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../widgets/appbar.dart';
import '../widgets/custom_theme.dart';
import '../widgets/secured_textfield.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Create password",
              style: CustomTheme.lightTheme.textTheme.headline1),
          Text("Create your new password to login",
              style: CustomTheme.lightTheme.textTheme.bodyText1),
          SecuredTextField(nameField: "Password", onChanged: (String str) {}),
          SecuredTextField(
              nameField: "Confirm password", onChanged: (String str) {}),
          MainButtonDark(name: "Create password", onPressed: () {}),
        ]),
      ),
    );
  }
}
