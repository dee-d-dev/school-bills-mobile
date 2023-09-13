import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/transaction_model.dart';

abstract class TransactionsRepository {
  Future<Result<List<TransactionModel>>> getAllAdminTransactions();
  Future<Result<List<TransactionModel>>> getMyTransactions();
  Future<Result<List<TransactionModel>>> getDepartmentTransactions();
  Future<Result<List<TransactionModel>>> getFacultyTransactions();
}
