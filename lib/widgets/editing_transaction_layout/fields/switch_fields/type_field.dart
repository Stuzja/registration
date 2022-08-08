import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/add_transaction/bloc/add_transaction_bloc.dart';
import '../../../../resources/enums/transaction_type.dart';
import 'switch_widget.dart';

class TypeField extends StatefulWidget {
  const TypeField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TypeFieldState();
}

class TypeFieldState extends State<TypeField> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTransactionBloc, AddTransactionState>(
      listener: (context, state) {
        if (state is FieldSuccess) {}
      },
      child: SwitchField(
        firstLabel: 'Profit',
        secondLabel: "Loss",
        switchTitle: 'Transaction type',
        onToggle: (ind) {
          TransactionType value;
          if (ind == 0) {
            value = TransactionType.profit;
          } else {
            value = TransactionType.loss;
          }
          context
              .read<AddTransactionBloc>()
              .add(TypeSubmitted(newValue: value));
        },
      ),
    );
  }
}
