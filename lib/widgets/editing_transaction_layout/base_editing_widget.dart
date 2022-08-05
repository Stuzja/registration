import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import 'package:registration/resources/enums/transaction_type.dart';

import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../resources/theme/custom_theme.dart';
import '../buttons/back_button.dart';
import '../buttons/main_button.dart';
import 'button_add_transaction.dart';
import 'fields/date_field.dart';
import 'fields/description_field.dart';
import 'fields/drop_down_field.dart';
import 'fields/money_field.dart';
import 'fields/switch_field.dart';

class BaseEditingTransactionWidget extends StatelessWidget {
  final String title;
  const BaseEditingTransactionWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();
    TextEditingController moneyController = TextEditingController();
    TransactionType type = TransactionType.loss;
    bool ready = false;
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
                  Text(title,
                      style: CustomTheme.lightTheme.textTheme.headline1),
                ],
              ),
            ),
            SwitchField(
              firstLabel: 'Profit',
              secondLabel: "Loss",
              switchTitle: 'Transaction type',
              onToggle: (ind) {
                if (ind == 0) {
                  type = TransactionType.profit;
                } else {
                  type = TransactionType.loss;
                }
              },
            ),
            SwitchField(
              firstLabel: 'OK',
              secondLabel: "Wait",
              switchTitle: 'Status',
              onToggle: (ind) {
                if (ind == 0) {
                  ready = true;
                } else {
                  ready = false;
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: const DateTextField(),
            ),
            DropDownField(dropItem:  TransactionCategory.values.map((e) => e.name).toList()),
            MoneyField(nameField: "Enter Amount", controller: moneyController),
            DescriptionField(
                nameField: "Description", controller: descriptionController),
            BlocProvider(
                create: (context) {
                  return TransactionsBloc(
                      repository: ActionsWithTransactionsRepository());
                },
                child: ButtonAddTransactionWidget(
                  ready: ready,
                  type: type,
                  moneyController: moneyController,
                  descriptionController: descriptionController,
                )),
          ],
        ),
      ),
    );
  }
}
