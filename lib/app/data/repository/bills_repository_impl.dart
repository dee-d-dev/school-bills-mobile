import 'package:flutter/cupertino.dart';
import 'package:school_bills/app/data/models/bill_model.dart';
import 'package:school_bills/app/data/models/pay_reference_model.dart';
import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/domain/bills_repository.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';

final class BillsRepositoryImpl implements BillsRepository {
  final NetworkService networkService;

  const BillsRepositoryImpl({required this.networkService});
  @override
  Future<Result<List<BillModel>>> getAllBills() async {
    try {
      final res = await networkService.get('/bills/all');

      final bills =
          (res.data['data'] as List).map((e) => BillModel.fromJson(e)).toList();

      return Result.success(bills);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get all bills'));
    }
  }

  @override
  Future<Result<List<BillModel>>> getMyBills() async {
    try {
      final res = await networkService.get('/profile/my-bills');

      final bills =
          (res.data['data'] as List).map((e) => BillModel.fromJson(e)).toList();

      return Result.success(bills);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get my bills'));
    }
  }

  @override
  Future<Result<PayReferenceModel>> payBill(String id) async {
    try {
      final res = await networkService.post('/bills/pay/$id');

      final reference = PayReferenceModel.fromJson(res.data['data']);

      return Result.success(reference);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get reference'));
    }
  }

  @override
  Future<Result<bool>> createBill(
      {required String title,
      required double amount,
      required String department,
      required String faculty,
      required String bankName,
      required String accountNo}) async {
    try {
      await networkService.post(
        '/bills/create',
        data: {
          'title': title,
          'amount': amount,
          'account_no': accountNo,
          'bank_name': bankName,
          'department': department,
          'faculty': faculty,
        },
      );
      return const Result.success(true);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get reference'));
    }
  }
}
