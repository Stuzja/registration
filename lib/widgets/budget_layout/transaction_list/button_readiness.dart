import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/enums/transaction_category.dart';

import '../../../models/transaction_model.dart';
import '../../../resources/constants/path_images.dart';

class ButtonElemReadiness extends StatefulWidget {
  final TransactionModel transaction;
  const ButtonElemReadiness({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonElemReadinessState();
}

class ButtonElemReadinessState extends State<ButtonElemReadiness> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        color: widget.transaction.category!.getColorTitle,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {},
        child: widget.transaction.ready
            ? SizedBox(
                height: 24.h,
                width: 24.w,
                child: Image.asset(checkMark),
              )
            : Container(),
      ),
    );
  }
}
