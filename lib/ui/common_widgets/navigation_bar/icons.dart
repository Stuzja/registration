import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/constants/path_images.dart';

List<Image> listIcons = [
  Image.asset(PathImages.iconHome),
  Image.asset(PathImages.iconCalendar),
  Image.asset(PathImages.iconWallet),
  Image.asset(PathImages.iconUser),
];

class IconWidget extends StatelessWidget {
  final Color colorActive;
  final Image image;
  const IconWidget({Key? key, required this.colorActive, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: 40.h,
            child: Stack(children: [
              Container(
                height: 40.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: colorActive),
              ),
              Center(
                child: image,
              ),
            ]),
          ),
        ]);
  }
}
