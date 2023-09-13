import 'package:flutter/foundation.dart';
import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/user_model.dart';
import 'package:school_bills/app/domain/auth_repository.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final SharedPreferences preferences;

  const AuthRepositoryImpl(
      {required this.networkService, required this.preferences});

  @override
  Future<Result<bool>> changePassword({
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await networkService.post(
        '/auth/change-password',
        data: {
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      return const Result.success(true);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to change password'));
    }
  }

  @override
  Future<Result<bool>> logout() async {
    try {
      await networkService.post('/auth/logout');
      await preferences.remove('token');
      await preferences.remove('emailOrMatNo');
      await preferences.remove('password');
      return const Result.success(true);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to log out'));
    }
  }

  @override
  Future<Result<UserModel>> silentSignIn() async {
    try {
      final emailOrMatNo = preferences.getString('emailOrMatNo');
      final password = preferences.getString('password');
      if (emailOrMatNo == null || password == null) {
        return Result.error(CustomError.message('No email or password found'));
      }
      return signIn(emailOrMatNo: emailOrMatNo, password: password);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to sign in silently'));
    }
  }

  @override
  Future<Result<UserModel>> signIn({
    required String emailOrMatNo,
    required String password,
  }) async {
    try {
      final res = await networkService.post(
        '/auth/signin',
        data: {
          emailOrMatNo.isEmail ? 'email' : 'matric_no': emailOrMatNo,
          'password': password
        },
      );
      final data = res.data['data'];

      preferences.setString('token', data['token']);
      preferences.setString('emailOrMatNo', emailOrMatNo);
      preferences.setString('password', password);

      return Result.success(UserModel.fromJson(data['user']));
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to sign in'));
    }
  }

  @override
  Future<Result<UserModel>> signUp({
    required String firstName,
    required String lastName,
    required String department,
    required String faculty,
    required String matricNo,
    required String email,
    required String password,
  }) async {
    try {
      final res = await networkService.post(
        '/auth/signup',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'department': department,
          'faculty': faculty,
          'matric_no': matricNo,
          'email': email,
          'password': password
        },
      );
      final data = res.data['data'];

      preferences.setString('token', data['token']);
      preferences.setString('emailOrMatNo', email);
      preferences.setString('password', password);

      return Result.success(UserModel.fromJson(data['user']));
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to sign up'));
    }
  }
}
