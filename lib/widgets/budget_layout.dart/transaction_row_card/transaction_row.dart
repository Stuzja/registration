import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/budget_layout.dart/transaction_row_card/transaction_row_widget.dart';
import '../../../models/transaction_model.dart';
import '../../../models/user_model.dart';

class TransactionRowWidget extends StatefulWidget {
  final bool ready;
  const TransactionRowWidget({Key? key, required this.ready}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionRowWidgetState();
}

class TransactionRowWidgetState extends State<TransactionRowWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.h,
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
            padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
            scrollDirection: Axis.horizontal,
            children: [
              if (widget.ready)
                for (var elem in snapshot.data!.docs
                    .map((DocumentSnapshot doc) =>
                        doc.data()! as Map<String, dynamic>)
                    .where((elem) => elem['ready'] == true))
                  TransactionRowCard(
                      transaction: TransactionModel.fromSnapshot(elem))
              else
                for (var elem in snapshot.data!.docs.map(
                    (DocumentSnapshot doc) =>
                        doc.data()! as Map<String, dynamic>))
                  TransactionRowCard(
                      transaction: TransactionModel.fromSnapshot(elem))
            ],
          );
        },
      ),
    );
  }
}
