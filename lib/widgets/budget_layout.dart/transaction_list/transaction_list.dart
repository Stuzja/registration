import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/transaction_model.dart';
import '../../../models/user_model.dart';
import 'transaction_list_elem.dart';

class TransactionListWidget extends StatefulWidget {
  final bool ready;
  const TransactionListWidget({Key? key, required this.ready})
      : super(key: key);

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
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          if (!snapshot.hasData) {
            return const Text("Empty");
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
      ),
    );
  }
}
