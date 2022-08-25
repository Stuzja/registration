import 'package:formz/formz.dart';

enum MoneyValidationError { pure, invalid }

class Money extends FormzInput<String, MoneyValidationError> {
  const Money.pure([super.value = '']) : super.pure();
  const Money.dirty([super.value = '']) : super.dirty();


  @override
  MoneyValidationError? validator(String? value) {
    return value != null 
        ? null
        : MoneyValidationError.invalid;
  }
}