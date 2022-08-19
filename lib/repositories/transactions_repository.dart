import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:registration/models/month_year_model.dart';
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

  Future<bool> editTransaction(
      {required String id,
      required TransactionType type,
      required bool ready,
      required DateTime date,
      required TransactionCategory category,
      required double value,
      String? description}) async {
    try {
      print(id);
      final docTransaction = storageTrans.doc(id);
      final transToJson = TransactionModel(
              id: id,
              type: type,
              ready: ready,
              date: date,
              category: category,
              value: value,
              description: description)
          .toJson();

      docTransaction.set(transToJson, SetOptions(merge: true));
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> deleteTransaction(
      {required TransactionModel transaction}) async {
    try {
      final docId = transaction.id;
      storageTrans.doc(docId).delete();
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

  double getResultMoney(
      {required List<TransactionModel> listTrans, required bool ready}) {
    if (listTrans.isEmpty) {
      return 0;
    }

    double sum = 0.0;
    if (ready) {
      for (var transaction in listTrans.where((tran) => tran.ready == true)) {
        if (transaction.type == TransactionType.profit) {
          sum += transaction.value!;
        } else {
          sum -= transaction.value!;
        }
      }
    } else {
      for (var transaction in listTrans) {
        if (transaction.type == TransactionType.profit) {
          sum += transaction.value!;
        } else {
          sum -= transaction.value!;
        }
      }
    }
    return sum;
  }

  List<FlSpot> getSpotsForGraphic({required List<TransactionModel> listTrans}) {
    List<FlSpot> listSpots = [];
    List<double> listSum = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    if (listTrans.isEmpty) {
      return listSpots;
    }

    for (var transaction in listTrans.where((tran) => tran.ready == true)) {
      if (transaction.type == TransactionType.profit) {
        listSum[transaction.date!.month - 1] += transaction.value!;
      } else {
        listSum[transaction.date!.month - 1] -= transaction.value!;
      }
    }

    for (var ind = 0; ind < 12; ind++) {
      listSpots.add(FlSpot(ind.toDouble(), listSum[ind] / 10000));
    }
    return listSpots;
  }

  bool compareYearMonth(DateTime date, MonthYear selectedDate) {
    if (date.year == selectedDate.year) {
      if (date.month == selectedDate.month) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
