import 'package:flutter/material.dart';

class MainButtonLight extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const MainButtonLight({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Text(name),
    );
  }
}
