import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration/models/user_model.dart';
import '../models/transaction_model.dart';
import '../resources/enums/transaction_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/enums/transaction_type.dart';

class ActionsWithTransactionsRepository {
  var storageTrans = FirebaseFirestore.instance
      .collection('users')
      .doc(thisUser.username)
      .collection('transactions');

  Future<bool> addTransaction(
      {required TransactionType type,
      required bool ready,
      required DateTime date,
      required TransactionCategory category,
      required double value,
      String? description}) async {
    try {
      final docTransaction = storageTrans.doc();
      final docId = docTransaction.id;
      final transToJson = TransactionModel(
              id: docId,
              type: type,
              ready: ready,
              date: date,
              category: category,
              value: value,
              description: description)
          .toJson();

      docTransaction.set(transToJson);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> changeReadinessTransaction(
      {required TransactionModel transaction, required bool newValue}) async {
    try {
      transaction.ready = newValue;
      var docCurrent = storageTrans.doc(transaction.id);
      print(transaction.id);
      docCurrent.set(transaction.toJson());
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  double getResultMoney({required AsyncSnapshot<dynamic> snapshot, required bool ready}) {
    if (!snapshot.hasData) {
      return 0;
    }

    double sum = 0.0;
    if (ready) {
      for (var elem in snapshot.data!.docs
          .map((DocumentSnapshot doc) => doc.data()! as Map<String, dynamic>)
          .where((elem) => elem['ready'] == true)) {
        var transaction = TransactionModel.fromSnapshot(elem);
        if (transaction.type == TransactionType.profit) {
          sum += transaction.value!;
        } else {
          sum -= transaction.value!;
        }
      }
    } else {
      for (var elem in snapshot.data!.docs
          .map((DocumentSnapshot doc) => doc.data()! as Map<String, dynamic>)) {
        var transaction = TransactionModel.fromSnapshot(elem);
        if (transaction.type == TransactionType.profit) {
          sum += transaction.value!;
        } else {
          sum -= transaction.value!;
        }
      }
    }
    return sum;
  }
}
