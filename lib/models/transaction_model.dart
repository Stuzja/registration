import 'package:registration/resources/enums/transaction_category.dart';
import '../resources/enums/transaction_type.dart';
import '../resources/formatters/formatters.dart';

class TransactionModel {
  TransactionType type;
  bool ready;
  DateTime? date;
  double? value;
  TransactionCategory? category;
  String? description;

  TransactionModel(
      {required this.type,
      required this.ready,
      required this.date,
      required this.category,
      required this.value,
      required this.description});

   Map<String, dynamic> toJson() => {
        'type': FormExtensionType(type).getString,
        'ready': ready,
        'category': FormExtensionCategory(category!).getString,
        'value': value,
        'date': date,
        'description': description,
      };
  
  TransactionModel.fromSnapshot(Map<String, dynamic> snapshot)
      : type = Formatters().fromStringToType(snapshot['type']),
        category = Formatters().fromStringToCategory(snapshot['category']),
        ready = snapshot['ready'],
        value = snapshot['value'],
        description = snapshot['description'],
        date = snapshot['date'].toDate();

}

TransactionModel prototypeTrans = TransactionModel(
    category: null,
    type: TransactionType.loss,
    ready: false,
    value: null,
    description: null,
    date: null);