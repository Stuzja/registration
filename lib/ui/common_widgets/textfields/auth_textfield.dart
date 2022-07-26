import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';

import '../../../resources/theme/custom_theme.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String nameField;
  final String? errorText;
  final void Function(String)? onChanged;
  final String? Function(String?) validator;
  final bool isSecured;
  const AuthTextField(
      {Key? key,
      required this.nameField,
      this.onChanged,
      this.errorText,
      this.controller,
      required this.validator,
      required this.isSecured})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AuthTextFieldState();
}

class AuthTextFieldState extends State<AuthTextField> {
  late bool _obscureText = widget.isSecured;

  void _showText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.h,
        width: 328.w,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _obscureText,
          cursorColor: ColorClass.greyLight,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 23.w),
            label: Text(widget.nameField),
            labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorText: widget.errorText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorClass.purple),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: widget.isSecured
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye, size: 20.h),
                    color: ColorClass.greyDark,
                    onPressed: _showText,
                  )
                : null,
          ),
          onChanged: widget.onChanged,
        ));
  }
}
