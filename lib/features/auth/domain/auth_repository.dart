import 'package:school_bills/core/models/result.dart';
import 'package:school_bills/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Result<UserModel>> signIn();
}
