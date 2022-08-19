import 'package:registration/resources/enums/transaction_category.dart';
import '../resources/enums/transaction_type.dart';
import '../resources/formatters/formatters.dart';

class TransactionModel {
  String? id;
  TransactionType type;
  bool ready;
  DateTime? date;
  double? value;
  TransactionCategory? category;
  String? description;

  TransactionModel(
      {this.id,
      required this.type,
      required this.ready,
      required this.date,
      required this.category,
      required this.value,
      required this.description});

  TransactionModel.fromJson(Map<String, dynamic> json)
      : type = Formatters().fromStringToType(json['type']),
        category = Formatters().fromStringToCategory(json['category']),
        id = json['id'],
        ready = json['ready'],
        value = json['value'],
        description = json['description'],
        date = json['date'].toDate();

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': FormExtensionType(type).getString,
        'ready': ready,
        'category': FormExtensionCategory(category!).getString,
        'value': value,
        'date': date,
        'description': description,
      };
}

TransactionModel prototypeTrans = TransactionModel(
    id: null,
    category: null,
    type: TransactionType.loss,
    ready: false,
    value: null,
    description: null,
    date: null);
