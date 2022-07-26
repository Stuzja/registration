import 'package:flutter/material.dart';
import 'colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          iconTheme: const IconThemeData(
            size: 13,
            color: greyLight,
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
