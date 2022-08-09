import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/widgets/editing_transaction_layout/fields/switch_fields/readiness_field.dart';
import '../../blocs/add_transaction/bloc/add_transaction_bloc.dart';
import '../../resources/theme/custom_theme.dart';
import '../buttons/back_button.dart';
import 'button_add_transaction.dart';
import 'fields/date_field.dart';
import 'fields/description_field.dart';
import 'fields/drop_down_field/category_field.dart';
import 'fields/money_field.dart';
import 'fields/switch_fields/type_field.dart';

class EditingTransactionWidget extends StatefulWidget {
  final String title;

  const EditingTransactionWidget({Key? key, required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => EditingTransactionWidgetState();
}

class EditingTransactionWidgetState extends State<EditingTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();
    TextEditingController moneyController = TextEditingController();
    return BlocProvider(
      create: (context) {
        return AddTransactionBloc(
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
                    Text(widget.title,
                        style: CustomTheme.lightTheme.textTheme.headline1),
                  ],
                ),
              ),
              const TypeField(),
              const ReadinessField(),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: const DateTextField(),
              ),
              const CategoryField(),
              MoneyField(controller: moneyController),
              DescriptionField(controller: descriptionController),
              BlocProvider(
                create: (context) {
                  return AddTransactionBloc(
                      repository: ActionsWithTransactionsRepository());
                },
                child: ButtonAddTransactionWidget(
                  moneyController: moneyController,
                  descriptionController: descriptionController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
