import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:registration/ui/pages/main_pages/editing_transaction_layout/fields/switch_fields/new_switch_field/switch_chapter.dart';

import '../../../common_widgets/buttons/back_button.dart';

import 'button_add_transaction.dart';
import 'fields/date_field.dart';
import 'fields/drop_down_field/category_field.dart';
import 'fields/switch_fields/readiness_field.dart';
import 'fields/switch_fields/type_field.dart';
import 'fields/transaction_field.dart';

class EditingTransactionWidget extends StatelessWidget {
  final String title;
  final TransactionModel? transaction;
  const EditingTransactionWidget(
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
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 36.h),
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.w),
                        child: const CustomBackButton()),
                    Text("$title a transaction",
                        style: CustomTheme.lightTheme.textTheme.headline1),
                  ],
                ),
              ),
              const TypeField(),
              const ReadinessField(),
              SizedBox(height: 16.h),
              DateTextField(initialDateTime: transaction?.date),
              SizedBox(height: 16.h),
              CategoryField(initialCategory: transaction?.category),
              TransactionField(
                  controller: moneyController,
                  keyboardType: TextInputType.number,
                  labelText: "Enter Amount"),
              SizedBox(height: 16.h),
              TransactionField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  labelText: "Description",
                  maxLines: 7),
              ButtonAddTransactionWidget(
                transaction: transaction,
                title: title,
                moneyController: moneyController,
                descriptionController: descriptionController,
              ),
            ],
          ),
        ),
      
    );
  }
}
