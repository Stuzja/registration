import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/repositories/transactions_repository.dart';
import '../../../resources/enums/transaction_category.dart';
import '../../../resources/enums/transaction_type.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  final ActionsWithTransactionsRepository repository;
  AddTransactionBloc({required this.repository})
      : super(AddTransactionInitial()) {
    on<TypeSubmitted>(_onTypeSubmitted);
    on<ReadinessSubmitted>(_onReadinessSubmitted);
    on<CategorySubmitted>(_onCategorySubmitted);
    on<DateSubmitted>(_onDateSubmitted);
    on<TransactionAdd>(_onTransactionSubmitted);
  }

  TransactionType _type = TransactionType.loss;
  bool _readiness = false;
  TransactionCategory? _category;
  DateTime? _date;

  void _onTypeSubmitted(
    TypeSubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    _type = event.newValue;
    emit(FieldSuccess());
  }

  void _onReadinessSubmitted(
    ReadinessSubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    _readiness = event.newValue;
    emit(FieldSuccess());
  }

  void _onCategorySubmitted(
    CategorySubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    _category = event.newValue;
    emit(FieldSuccess());
  }

  void _onDateSubmitted(
    DateSubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    _date = event.newValue;
    emit(FieldSuccess());
  }

  Future<void> _onTransactionSubmitted(
    TransactionAdd event,
    Emitter<AddTransactionState> emit,
  ) async {
    //  emit(AddTransactionLoading());
    if (_category != null) {
      bool addSuccess = await repository.addTransaction(
          type: _type,
          ready: _readiness,
          date: DateTime.now(),
          category: _category!,
          value: 123,
          description: "hhh");
      if (addSuccess) {
        emit(AddTransactionSuccess());
      } else {
        print("!!!!!!!!!!!!!!!!!!!!!!!!");
        emit(AddTransactionFailed());
      }
    } else {
      print("------------------------------");
      emit(AddTransactionFailed());
    }
  }
}
