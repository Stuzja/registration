import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import 'package:registration/resources/formatters/formatters.dart';

import 'drop_down_widget.dart';

class CategoryField extends StatelessWidget {
  final TransactionCategory? initialCategory;

  const CategoryField({Key? key, required this.initialCategory})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropDownField(
        initialCategory: initialCategory,
        dropItem: TransactionCategory.values.map((e) => e.getString).toList(),
        onChanged: (value) {
          context.read<TransactionsBloc>().add(FieldSubmitted(
              category: Formatters().fromStringToCategory(value)));
        });
  }
}
