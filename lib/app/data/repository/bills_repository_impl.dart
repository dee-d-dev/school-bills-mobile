import 'package:flutter/cupertino.dart';
import 'package:school_bills/app/data/models/bill_model.dart';
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
      print(res.data);

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
      print(res.data);

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
  Future<Result<List<BillModel>>> getPaidBills() async {
    try {
      final res = await networkService.get('/profile/paid-bills');
      print(res.data);

      final bills =
          (res.data['data'] as List).map((e) => BillModel.fromJson(e)).toList();

      return Result.success(bills);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get paid bills'));
    }
  }

  @override
  Future<Result<List<BillModel>>> getUnpaidBills() async {
    try {
      final res = await networkService.get('/profile/unpaid-bills');
      print(res.data);

      final bills =
          (res.data['data'] as List).map((e) => BillModel.fromJson(e)).toList();

      return Result.success(bills);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get unpaid bills'));
    }
  }
}
