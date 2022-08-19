import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/widgets/editing_transaction_layout/button_add_transaction.dart';
import 'package:registration/widgets/editing_transaction_layout/fields/switch_fields/readiness_field.dart';
import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../models/transaction_model.dart';
import '../../resources/theme/custom_theme.dart';
import '../buttons/back_button.dart';
import 'fields/date_field.dart';
import 'fields/description_field.dart';
import 'fields/drop_down_field/category_field.dart';
import 'fields/money_field.dart';
import 'fields/switch_fields/type_field.dart';

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

    return BlocProvider(
      create: (context) {
        return TransactionsBloc(
            repository: ActionsWithTransactionsRepository());
      },
      child: SafeArea(
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
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: DateTextField(initialDateTime: transaction?.date),
              ),
              CategoryField(initialCategory: transaction?.category),
              MoneyField(controller: moneyController),
              DescriptionField(controller: descriptionController),
              ButtonAddTransactionWidget(
                transaction: transaction,
                title: title,
                moneyController: moneyController,
                descriptionController: descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
