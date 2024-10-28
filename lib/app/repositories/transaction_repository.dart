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
        title: 'Salary',
        value: 500,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Dinner',
        value: -50,
        date: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch,
      ),
    ];
  }
}
