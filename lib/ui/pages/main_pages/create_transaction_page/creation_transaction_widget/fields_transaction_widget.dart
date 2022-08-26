import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:registration/ui/common_widgets/buttons/back_button.dart';

import 'button_add_transaction.dart';
import 'fields/date_field/date_field.dart';
import 'fields/drop_down_field/category_field.dart';
import 'fields/switch_fields/readiness_field.dart';
import 'fields/switch_fields/type_field.dart';
import 'fields/text_fields/transaction_field.dart';

class FieldsForTransactionWidget extends StatelessWidget {
  final String title;
  final TransactionModel? transaction;
  const FieldsForTransactionWidget(
      {Key? key, required this.title, this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptionController =
        TextEditingController(text: transaction?.description ?? "");
    var moneyController =
        TextEditingController(text: transaction?.value.toString() ?? "");

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 13.h),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      child: const CustomBackButton()),
                  Text("$title a transaction",
                      style: CustomTheme.lightTheme.textTheme.headline1),
                ],
              ),
            ),
            Wrap(spacing: 20.h, direction: Axis.vertical, children: [
              Column(children: [
                TypeField(type: transaction?.type),
                ReadinessField(readiness: transaction?.ready),
              ]),
              DateTextField(initialDateTime: transaction?.date),
              CategoryField(initialCategory: transaction?.category),
              TransactionField(
                  controller: moneyController,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (newValue) {
                    context.read<TransactionsBloc>().add(FieldSubmitted(
                        value: double.parse(moneyController.text)));
                  },
                  labelText: "Enter Amount"),
              TransactionField(
                  maxLines: 7,
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  labelText: "Description",
                  onFieldSubmitted: (newValue) {
                    context.read<TransactionsBloc>().add(FieldSubmitted(
                        value: double.parse(moneyController.text)));
                  }),
              ButtonAddWidget(transaction: transaction, title: title),
            ]),
          ],
        ),
      ),
    );
  }
}
