import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import 'package:registration/resources/theme/custom_theme.dart';

class DropDownField extends StatefulWidget {
  final List dropItem;
  final TransactionCategory? initialCategory;
  final void Function(String?)? onChanged;
  const DropDownField({
    Key? key,
    required this.dropItem,
    this.onChanged,
    this.initialCategory,
  }) : super(key: key);
  @override
  State<DropDownField> createState() => DropDownFieldState();
}

class DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 328.w,
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 4,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          ),
        ),
        isExpanded: true,
        // value: widget.initialCategory.toString(),
        hint: Text('Category',
            style: CustomTheme.lightTheme.textTheme.labelMedium),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 58,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: widget.dropItem
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                      style: CustomTheme.lightTheme.textTheme.labelMedium
                          ?.copyWith(color: Colors.black)),
                ))
            .toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
