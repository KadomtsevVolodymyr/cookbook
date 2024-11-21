import 'package:balancebyte/data/model/token_model.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository authRepository;

  AuthCubit(this.authRepository) : super(const AuthState.initial());

  Future<void> loginWithGoogle() async {
    emit(const AuthState.loading());

    final user = await authRepository.loginWithGoogle();
    user.when(
      success: (TokenModel token) {
        authRepository.saveToken(token);
        emit(const AuthState.authenticated());
      },
      error: (error) {
        emit(AuthState.error(error.toString()));
      },
    );
  }

  Future<void> loginWithFacebook() async {
    emit(const AuthState.loading());
    final result = await authRepository.loginWithFacebook();
    result.when(
      success: (token) {
        authRepository.saveToken(token);
        emit(const AuthState.authenticated());
      },
      error: (error) => emit(AuthState.error(error.toString())),
    );
  }

  Future<void> loginWithApple() async {
    emit(const AuthState.loading());
    final result = await authRepository.loginWithApple();
    result.when(
      success: (token) {
        authRepository.saveToken(token);
        emit(const AuthState.authenticated());
      },
      error: (error) => emit(AuthState.error(error.toString())),
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(const AuthState.loading());
    final result =
        await authRepository.signUp(email: email, password: password);
    result.when(
      success: (message) {
        // User still not authenticated after sign-up, just created an account.
        emit(const AuthState.authenticatedEmail());
      },
      error: (error) => emit(AuthState.error(error.toString())),
    );
  }

  Future<void> activateUser({required String code}) async {
    emit(const AuthState.loading());
    final result = await authRepository.activateUser(code: code);
    result.when(
      success: (token) {
        authRepository.saveToken(token);
        emit(const AuthState.authenticated());
      },
      error: (error) => emit(AuthState.emailConfirmationError()),
    );
  }

  Future<void> resendVerificationCode({required String email}) async {
    emit(const AuthState.loading());
    final result = await authRepository.resendVerificationCode(email: email);
    result.when(
      success: (message) {
        emit(const AuthState.unauthenticated());
      },
      error: (error) => emit(AuthState.error(error.toString())),
    );
  }

  Future<void> updateVerificationState() async {
    emit(const AuthState.unauthenticated());
  }

  Future<void> login({required String login, required String password}) async {
    emit(const AuthState.loading());
    final result = await authRepository.login(login: login, password: password);
    result.when(
      success: (token) {
        authRepository.saveToken(token);
        emit(const AuthState.authenticated());
      },
      error: (error) => emit(AuthState.error(error.toString())),
    );
  }

  Future<void> refresh({required String refreshToken}) async {
    emit(const AuthState.loading());
    final result = await authRepository.refresh(refreshToken: refreshToken);
    result.when(
      success: (token) {
        authRepository.saveToken(token);
        emit(const AuthState.authenticated());
      },
      error: (error) => emit(AuthState.error(error.toString())),
    );
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    await _safeCall(authRepository.logout());

    emit(const AuthState.unauthenticated());
  }

  Future<void> _safeCall(Future<void> action) async {
    try {
      await action;
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
