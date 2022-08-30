import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_model.dart';
import '../../../resources/constants/path_images.dart';
import '../../../resources/theme/custom_theme.dart';
import '../../common_widgets/buttons/face_id_button.dart';
import '../../common_widgets/buttons/logout_text_button.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 49.h, bottom: 121.h),
      child: Column(
        children: [
          SizedBox(width: 160.h, height: 160.h, child: Image.asset(logoMobyte)),
          Container(
            padding: EdgeInsets.only(top: 48.h, bottom: 70.h),
            child: Column(children: [
              Text(thisUser.username!,
                  style: CustomTheme.lightTheme.textTheme.headline1),
              Text(thisUser.email!,
                  style: CustomTheme.lightTheme.textTheme.headline1),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 80.h),
            child: const FaceIdSwitcher(),
          ),
          const LogoutButton(),
        ],
      ),
    );
  }
}
