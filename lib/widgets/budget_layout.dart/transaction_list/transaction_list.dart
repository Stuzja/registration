import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transactions_repository.dart';

import '../../../models/transaction_model.dart';
import '../../../models/user_model.dart';
import 'transaction_list_elem.dart';

/*class TransactionListWidget extends StatefulWidget {
  const TransactionListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionListWidgetState();
}

class TransactionListWidgetState extends State<TransactionListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 393.h,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(thisUser.username)
            .collection('transactions')
            .snapshots().listen((event) { }),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: [
              for (var elem
                  //   in snapshot.data!.docs.map((doc) => jsonDecode((doc.data().toString())).toList())
                  in ActionsWithTransactionsRepository()
                      .formatToTransaction(snapshot))
                TransactionListElem(transaction: elem)
            ],
          );
        },
      ),
    );
  }
}
*/