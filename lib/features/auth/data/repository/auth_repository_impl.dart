import 'package:flutter/foundation.dart';
import 'package:school_bills/core/models/result.dart';
import 'package:school_bills/features/auth/data/models/user_model.dart';
import 'package:school_bills/features/auth/domain/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Result<UserModel>> signIn() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final data = {
        'firstName': 'ifeanyi',
        'lastName': 'onuoha',
        'age': 27,
      };
      return Result.success(UserModel.fromJson(data));
    } catch (error) {
      debugPrint('$error');
      return const Result.error(CustomError.message('Failed to sign in'));
    }
  }
}
