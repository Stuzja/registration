import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/constants/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorClass.purple,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          toolbarHeight: 0.0,

        );
}


          /*iconTheme: const IconThemeData(
            size: 13,
            color: ColorClass.greyLight,
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
          ],*/