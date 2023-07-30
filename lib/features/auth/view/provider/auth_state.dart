import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_bills/features/auth/data/models/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool signingIn,
    @Default(null) UserModel? user,
  }) = _AuthState;
}
