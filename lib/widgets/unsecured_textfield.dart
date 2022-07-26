import 'package:flutter/material.dart';
import 'colors.dart';
import 'custom_theme.dart';

class UnsecuredTextField extends StatelessWidget {
  final String nameField;
  final String? errorText;
  final void Function(String) onChanged;
  const UnsecuredTextField(
      {Key? key,
      required this.nameField,
      required this.onChanged,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        width: 328,
        child: TextField(
          cursorColor: greyLight,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
            label: Text(nameField),
            labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorText: errorText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: purple),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: onChanged,
        ));
  }
}
