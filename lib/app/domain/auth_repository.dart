import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Result<UserModel>> signIn();
}
