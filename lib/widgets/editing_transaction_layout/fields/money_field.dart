import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/constants/colors.dart';
import '../../../resources/theme/custom_theme.dart';

class MoneyField extends StatelessWidget {
  final TextEditingController controller;
  const MoneyField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.h,
        width: 328.w,
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          cursorColor: ColorClass.greyLight,
          decoration: InputDecoration(
            contentPadding:
                 EdgeInsets.symmetric(vertical: 18.h, horizontal: 23.w),
            label: const Text("Enter Amount"),
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
