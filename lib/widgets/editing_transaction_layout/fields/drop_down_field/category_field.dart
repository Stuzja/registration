import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/add_transaction/bloc/add_transaction_bloc.dart';
import '../../../../resources/enums/transaction_category.dart';
import '../../../../resources/formatters/formatters.dart';
import 'drop_down_widget.dart';

class CategoryField extends StatefulWidget {
  const CategoryField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryFieldState();
}

class CategoryFieldState extends State<CategoryField> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTransactionBloc, AddTransactionState>(
      listener: (context, state) {
        if (state is FieldSuccess) {
        }
      },
      child: DropDownField(
        dropItem: TransactionCategory.values.map((e) => e.getString).toList(),
        onChanged: (value) {
          context.read<AddTransactionBloc>().add(CategorySubmitted(
              newValue: Formatters().fromStringToCategory(value)));
        },
      ),
    );
  }
}
