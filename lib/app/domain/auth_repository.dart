import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Result<bool>> changePassword();
  Future<Result<bool>> logout();
  Future<Result<UserModel>> silentSignIn();
  Future<Result<UserModel>> signIn({
    required String email,
    required String password,
  });
  Future<Result<UserModel>> signUp({
    required String firstName,
    required String lastName,
    required String department,
    required String email,
    required String password,
  });
}
