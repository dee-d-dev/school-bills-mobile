import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_bills/app/data/models/user_model.dart';

part 'generated/auth_state.freezed.dart';

enum AuthLoadingState { idle, signingUp, signingIn }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthLoadingState.idle) AuthLoadingState state,
    @Default(null) UserModel? user,
  }) = _AuthState;
}
