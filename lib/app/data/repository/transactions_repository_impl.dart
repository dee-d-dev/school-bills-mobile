import 'package:flutter/cupertino.dart';
import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/transaction_model.dart';
import 'package:school_bills/app/domain/transactions_repository.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';

final class TransactionsRepositoryImpl implements TransactionsRepository {
  final NetworkService networkService;

  const TransactionsRepositoryImpl({required this.networkService});

  @override
  Future<Result<List<TransactionModel>>> getAllAdminTransactions() async {
    try {
      final res = await networkService.get('/admin/transactions');

      final transactions = (res.data['data'] as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList();

      return Result.success(transactions);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(
          CustomError.message('Failed to get all admin transactions'));
    }
  }

  @override
  Future<Result<List<TransactionModel>>> getDepartmentTransactions() async {
    try {
      final res = await networkService.get('/profile/transactions/department');

      final transactions = (res.data['data'] as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList();

      return Result.success(transactions);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(
          CustomError.message('Failed to get department transactions'));
    }
  }

  @override
  Future<Result<List<TransactionModel>>> getFacultyTransactions() async {
    try {
      final res = await networkService.get('/profile/transactions/faculty');

      final transactions = (res.data['data'] as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList();

      return Result.success(transactions);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(
          CustomError.message('Failed to get faculty transactions'));
    }
  }

  @override
  Future<Result<List<TransactionModel>>> getMyTransactions() async {
    try {
      final res = await networkService.get('/profile/transactions');

      final transactions = (res.data['data'] as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList();

      return Result.success(transactions);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(
          CustomError.message('Failed to get your transactions'));
    }
  }
}
