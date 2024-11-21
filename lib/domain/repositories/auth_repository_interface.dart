import 'package:balancebyte/data/model/token_model.dart';
import 'package:balancebyte/domain/entities/result.dart';

abstract interface class IAuthRepository {
  Future<Result<TokenModel>> loginWithGoogle();
  Future<Result<TokenModel>> loginWithFacebook();
  Future<Result<TokenModel>> loginWithApple();

  Future<Result<void>> signUp({
    required String email,
    required String password,
  });
  Future<Result<TokenModel>> activateUser({required String code});
  Future<Result<void>> resendVerificationCode({required String email});
  Future<Result<TokenModel>> login({
    required String login,
    required String password,
  });
  Future<Result<TokenModel>> refresh({required String refreshToken});

  Future<void> logout();
  Future<void> saveToken(TokenModel token);
}
