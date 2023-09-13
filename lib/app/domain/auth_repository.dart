import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Result<bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Result<bool>> logout();
  Future<Result<UserModel>> silentSignIn();
  Future<Result<UserModel>> signIn({
    required String emailOrMatNo,
    required String password,
  });
  Future<Result<UserModel>> signUp({
    required String firstName,
    required String lastName,
    required String department,
    required String faculty,
    required String matricNo,
    required String email,
    required String password,
  });
}
