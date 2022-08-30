import 'package:fl_chart/fl_chart.dart';

import '../models/month_year_model.dart';
import '../models/transaction_model.dart';
import '../resources/enums/transaction_category.dart';
import '../resources/enums/transaction_type.dart';

abstract class AbstractTransactionRepository {
  Future<bool> addTransaction({required TransactionModel transaction});

  Future<bool> editTransaction(
      {required String id,
      required TransactionType type,
      required bool ready,
      required DateTime date,
      required TransactionCategory category,
      required double value,
      String? description});

  Future<bool> deleteTransaction({required TransactionModel transaction});

  Future<bool> changeReadinessTransaction(
      {required TransactionModel transaction, required bool newValue});
  double getResultMoney(
      {required List<TransactionModel> listTrans, required bool ready});

  List<FlSpot> getSpotsForGraphic({required List<TransactionModel> listTrans});
  bool compareYearMonth(DateTime date, MonthYear selectedDate);
}
