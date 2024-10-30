import 'package:finan_control/app/core/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();
  Future<List<TransactionModel>> getAllTransactions();
}

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransaction() {
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      TransactionModel(
        title: 'Salario',
        value: 1000,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Almoço',
        value: -25,
        date: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Exemplo1',
        value: -100,
        date: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Exemplo2',
        value: -20,
        date: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Exemplo3',
        value: -80,
        date: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Exemplo4',
        value: 300,
        date: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch,
      ),
    ];
  }
}
