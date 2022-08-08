import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/add_transaction/bloc/add_transaction_bloc.dart';
import '../buttons/main_button.dart';

class ButtonAddTransactionWidget extends StatefulWidget {
  final TextEditingController moneyController;
  final TextEditingController descriptionController;
  const ButtonAddTransactionWidget({
    Key? key,
    required this.moneyController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonAddTransactionWidgetState();
}

class ButtonAddTransactionWidgetState
    extends State<ButtonAddTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTransactionBloc, AddTransactionState>(
      listener: (context, state) {
        if (state is AddTransactionFailed) {
          print("bad");
        }
        if (state is AddTransactionLoading) {
          Navigator.pushNamed(context, '/splash');
        }
        if (state is AddTransactionSuccess) {
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: MainButtonDark(
            name: 'Add',
            onPressed: () {
              context.read<AddTransactionBloc>().add(TransactionAdd(
                    money: double.parse(widget.moneyController.text),
                    description: widget.descriptionController.text,
                  ));
            }),
      ),
    );
  }
}
