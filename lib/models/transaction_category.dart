import 'package:registration/models/transaction.dart';

enum TransactionType { profit, loss }

enum TransactionCategory {
  salariesDev,
  salariesMg,
  internalHr,
  externalHr,
  credit,
  dividends,
  bankCharges,
  taxes,
  awards,
  others
}

List<Transaction> listTransaction = [
  Transaction(
      type: TransactionType.profit,
      ready: false,
      date: DateTime.now(),
      category: TransactionCategory.awards,
      value: 1100.000),
  Transaction(
      type: TransactionType.loss,
      ready: true,
      date: DateTime.now(),
      category: TransactionCategory.credit,
      value: 200.000),
  Transaction(
      type: TransactionType.loss,
      ready: false,
      date: DateTime.now(),
      category: TransactionCategory.salariesDev,
      value: 1100.000),
];
