import 'package:school_bills/app/data/models/bill_model.dart';
import 'package:school_bills/app/data/models/pay_reference_model.dart';
import 'package:school_bills/app/data/models/result.dart';

abstract class BillsRepository {
  Future<Result<List<BillModel>>> getAllBills();
  Future<Result<List<BillModel>>> getMyBills();
  Future<Result<PayReferenceModel>> payBill(String id);
  Future<Result<bool>> createBill({
    required String title,
    required double amount,
    required String department,
    required String faculty,
    required String bankName,
    required String accountNo,
  });
}
