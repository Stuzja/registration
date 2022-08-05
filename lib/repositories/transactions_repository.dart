import 'package:firebase_auth/firebase_auth.dart';

import '../models/transaction.dart';
import '../resources/enums/transaction_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/enums/transaction_type.dart';

class ActionsWithTransactionsRepository {
  Future addTransaction(
      {required int id,
      required String userName,
      required TransactionType type,
      required bool ready,
      required DateTime date,
      required TransactionCategory category,
      required double value,
      String? description}) async {
    final username = FirebaseAuth.instance.currentUser;
    final docTransaction = FirebaseFirestore.instance
        .collection('users')
        .doc(userName)
        .collection('transactions')
        .doc(id.toString());
    final transToJson = TransactionModel(
            type: type,
            ready: ready,
            date: date,
            category: category,
            value: value,
            description: description)
        .toJson();

    try {
      docTransaction.set(transToJson);
    } on FirebaseAuthException catch (e) {}
  }
}
