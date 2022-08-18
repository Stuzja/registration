import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'transaction_list_elem.dart';

class TransactionListWidget extends StatelessWidget {
  final bool ready;
  const TransactionListWidget({Key? key, required this.ready})
      : super(key: key);

/*
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
            .collection('users')
            .doc(thisUser.username)
            .collection('transactions')
            .snapshots().listen((event) { })
  }
*/
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 393.h,
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
            builder: (context, state) {
          if (state is FetchLoadingState) {
            return const CircularProgressIndicator();
          }
          if (state is FetchState) {
            return ListView(
              children: [
                if (ready)
                  for (var elem
                      in state.transactions.where((tran) => tran.ready == true))
                    TransactionListElem(transaction: elem)
                else
                  for (var elem in state.transactions)
                    TransactionListElem(transaction: elem)
              ],
            );
          }
          return const Text("Nothing here...");
        })

        /*StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(thisUser.username)
            .collection('transactions')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Empty"));
          }

          return ListView(
            children: [
              if (widget.ready)
                for (var elem in snapshot.data!.docs
                    .map((DocumentSnapshot doc) =>
                        doc.data()! as Map<String, dynamic>)
                    .where((elem) => elem['ready'] == true))
                  TransactionListElem(
                      transaction: TransactionModel.fromSnapshot(elem))
              else
                for (var elem in snapshot.data!.docs.map(
                    (DocumentSnapshot doc) =>
                        doc.data()! as Map<String, dynamic>))
                  TransactionListElem(
                      transaction: TransactionModel.fromSnapshot(elem))
            ],
          );
        },
      ),*/
        );
  }
}
