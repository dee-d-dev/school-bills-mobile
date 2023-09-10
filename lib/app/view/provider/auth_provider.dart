import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/domain/auth_repository.dart';
import 'package:school_bills/app/view/provider/auth_state.dart';
import 'package:school_bills/core/di/service_locator.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service.dart';

final authProvider = NotifierProvider<AuthProvider, AuthState>(
  () => sl<AuthProvider>(),
);

final class AuthProvider extends Notifier<AuthState> {
  final AuthRepository authRepository;
  final DialogService dialogService;
  AuthProvider({required this.authRepository, required this.dialogService});

  @override
  AuthState build() => const AuthState();

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String department,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(state: AuthLoadingState.signingUp);
    final res = await authRepository.signUp(
      firstName: firstName,
      lastName: lastName,
      department: department,
      email: email,
      password: password,
    );
    state = state.copyWith(state: AuthLoadingState.idle);
    return res.when(
      success: (user) {
        state = state.copyWith(user: user);
        return true;
      },
      error: (error) {
        dialogService.displayMessage(error.message);
        return false;
      },
    );
  }

  Future<bool> signIn({
    required String emailOrMatNo,
    required String password,
  }) async {
    state = state.copyWith(state: AuthLoadingState.signingIn);
    final res = await authRepository.signIn(
      emailOrMatNo: emailOrMatNo,
      password: password,
    );
    state = state.copyWith(state: AuthLoadingState.idle);
    return res.when(
      success: (user) {
        state = state.copyWith(user: user);
        return true;
      },
      error: (error) {
        dialogService.displayMessage(error.message);
        return false;
      },
    );
  }

  Future<bool> silentSignIn() async {
    final res = await authRepository.silentSignIn();
    return res.when(
      success: (user) {
        state = state.copyWith(user: user);
        return true;
      },
      error: (error) => false,
    );
  }

  Future<bool> logout() async {
    final res = await authRepository.logout();
    return res.when(
      success: (success) => success,
      error: (error) {
        dialogService.displayMessage(error.message);
        return false;
      },
    );
  }
}
