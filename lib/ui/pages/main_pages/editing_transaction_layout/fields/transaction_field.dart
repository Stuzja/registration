import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/resources/theme/custom_theme.dart';

class TransactionField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function()? onTap;
  final bool? readOnly;
  const TransactionField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.keyboardType,
      this.maxLines,
      this.onTap,
      this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: ColorClass.greyLight,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
          alignLabelWithHint: true,
          label: Align(
            alignment: Alignment.topLeft,
            child: Text(labelText),
          ),
          labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 3)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorClass.purple, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        readOnly: readOnly ?? false,
        onTap: onTap,
      ),
    );
  }
}
