import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/constants/colors.dart';
import '../resources/theme/custom_theme.dart';

// ignore: must_be_immutable
class UnsecuredTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String nameField;
  final String? errorText;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  const UnsecuredTextField(
      {Key? key,
      required this.nameField,
      required this.onChanged,
      this.errorText,
      this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.h,
        width: 328.w,
        child: TextFormField(
          validator: validator,
          controller: controller,
          cursorColor: ColorClass.greyLight,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 23.w),
            label: Text(nameField),
            labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorText: errorText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorClass.purple),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: onChanged,
        ));
  }
}
