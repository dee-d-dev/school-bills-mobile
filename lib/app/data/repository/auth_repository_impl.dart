import 'package:flutter/foundation.dart';
import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/data/models/user_model.dart';
import 'package:school_bills/app/domain/auth_repository.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final SharedPreferences preferences;

  const AuthRepositoryImpl(
      {required this.networkService, required this.preferences});

  @override
  Future<Result<bool>> changePassword() async {
    try {
      await networkService.get('/auth/signin');
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
      final email = preferences.getString('email');
      final password = preferences.getString('password');
      if (email == null || password == null) {
        return Result.error(CustomError.message('No email or password found'));
      }
      return signIn(emailOrMatNo: email, password: password);
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
        data: {'email': emailOrMatNo, 'password': password},
      );
      final token = res.headers.value('token');

      if (token != null) {
        preferences.setString('token', token);
        preferences.setString('email', emailOrMatNo);
        preferences.setString('password', password);
      }
      return Result.success(UserModel.fromJson(res.data['data']));
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
          'email': email,
          'password': password
        },
      );
      final token = res.headers.value('token');

      if (token != null) {
        preferences.setString('token', token);
        preferences.setString('email', email);
        preferences.setString('password', password);
      }
      return Result.success(UserModel.fromJson(res.data['data']));
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to sign up'));
    }
  }
}
