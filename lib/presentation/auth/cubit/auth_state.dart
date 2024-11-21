// presentation/cubit/auth_state.dart
import 'package:balancebyte/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.authenticatedEmail() = _AuthenticatedEmail;
  const factory AuthState.loginSuccess() = _LoginSuccess;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.emailConfirmationError() = _EmailConfirmationError;
  const factory AuthState.emailConfirmationSuccess() =
      _EmailConfirmationSuccess;
  const factory AuthState.error(String message) = _Error;
}
