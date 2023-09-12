import 'package:school_bills/app/data/models/bill_model.dart';
import 'package:school_bills/app/data/models/result.dart';

abstract class BillsRepository {
  Future<Result<List<BillModel>>> getAllBills();
  Future<Result<List<BillModel>>> getMyBills();
  Future<Result<List<BillModel>>> getPaidBills();
  Future<Result<List<BillModel>>> getUnpaidBills();
}
