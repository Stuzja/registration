import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/constants/colors.dart';
import '../../../resources/theme/custom_theme.dart';

class MoneyField extends StatelessWidget {
  final TextEditingController controller;
  final String nameField;
  final String? Function(String?)? validator;
  const MoneyField(
      {Key? key,
      required this.nameField,
      required this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.h,
        width: 328.w,
        child: TextFormField(
          keyboardType: TextInputType.number,
          validator: validator,
          controller: controller,
          cursorColor: ColorClass.greyLight,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
            label: Text(nameField),
            labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorClass.purple),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}
