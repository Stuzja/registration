import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class FloatingActionButtonBar extends StatelessWidget {
  const FloatingActionButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorClass.purple,
      onPressed: () => Navigator.pushNamed(context, '/add'),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
