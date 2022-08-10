import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import '../../../blocs/transactions/bloc/transactions_bloc.dart';
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
    bool ready = widget.transaction.ready;

    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is ReadinessChangedSuccess) {
          setState(() {
            ready = !ready;
          });
        }
      },
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: widget.transaction.category!.getColorTitle,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {
            context
                .read<TransactionsBloc>()
                .add(ReadinessChanged(transaction: widget.transaction));
          },
          child: ready
              ? SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Image.asset(checkMark),
                )
              : Container(),
        ),
      ),
    );
  }
}
