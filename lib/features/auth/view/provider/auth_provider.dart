import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/core/di/service_locator.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service.dart';
import 'package:school_bills/features/auth/domain/auth_repository.dart';

import 'auth_state.dart';

final authProvider = NotifierProvider<AuthProvider, AuthState>(
  () => sl<AuthProvider>(),
);

final class AuthProvider extends Notifier<AuthState> {
  final AuthRepository authRepository;
  final DialogService dialogService;
  AuthProvider({required this.authRepository, required this.dialogService});

  @override
  AuthState build() => const AuthState();

  Future<void> signIn() async {
    state = state.copyWith(signingIn: true);
    final res = await authRepository.signIn();
    state = state.copyWith(signingIn: false);
    res.when(
      success: (user) => state = state.copyWith(user: user),
      error: (error) => dialogService.displayMessage(error.message),
    );
  }
}
