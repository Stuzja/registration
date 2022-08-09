import 'package:registration/resources/enums/transaction_category.dart';
import '../resources/enums/transaction_type.dart';

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
      
  TransactionModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        category = json['category'],
        ready = json['ready'],
        value = json['value'],
        description = json['description'],
        date = DateTime.parse(json['date'].toDate().toString());
}

TransactionModel prototypeTrans = TransactionModel(
    category: null,
    type: TransactionType.loss,
    ready: false,
    value: null,
    description: null,
    date: null);
