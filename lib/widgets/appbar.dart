import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          iconTheme: IconThemeData(
            size: 13.h,
            color: grey,
          ),
          leading: IconButton(
            icon: const Icon(Icons.circle),
            onPressed: () {},
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.square),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.circle),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.square),
              onPressed: () {},
            )
          ],
        );
}
