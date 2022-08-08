import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration/models/user_model.dart';
import '../models/transaction_model.dart';
import '../resources/enums/transaction_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/enums/transaction_type.dart';

class ActionsWithTransactionsRepository {
  Future<bool> addTransaction(
      {required TransactionType type,
      required bool ready,
      required DateTime date,
      required TransactionCategory category,
      required double value,
      String? description}) async {
    try {
      var count = await FirebaseFirestore.instance
              .collection('users')
              .doc(thisUser.username)
              .collection('transactions')
              .get()
              .then((res) => res.size) +
          1;
      final docTransaction = FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .doc(count.toString());
      final transToJson = TransactionModel(
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

  Future<List<TransactionModel>> getListTransactions() async {
    List<TransactionModel> listTransaction = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .get();
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        var data = jsonDecode(queryDocumentSnapshot.data().toString());
        listTransaction.add(TransactionModel.fromJson(data));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return listTransaction;
  }

  List<TransactionModel> formatToTransaction(
      AsyncSnapshot<QuerySnapshot> snapshot) {
    List<TransactionModel> listTransaction = [];
    try {
      print(
          "-----------------------------------------------------------------------");
      print(snapshot.data);
      if (snapshot.data != null) {
        for (var queryDocumentSnapshot in snapshot.data!.docs) {
          var data = jsonDecode(queryDocumentSnapshot.data().toString());
          listTransaction.add(TransactionModel.fromJson(data));
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return listTransaction;
  }
}
