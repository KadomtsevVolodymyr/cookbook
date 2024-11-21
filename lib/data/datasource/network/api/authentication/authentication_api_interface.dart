import 'package:balancebyte/data/datasource/network/exchange_models/response.dart';
import 'package:balancebyte/data/model/token_model.dart';

abstract class IAuthenticationApi {
  Future<NetworkResponse<TokenModel>> exchangeFirebaseTokenForAppToken();

  Future<NetworkResponse<void>> signUp({
    required String email,
    required String password,
  });

  Future<NetworkResponse<TokenModel>> activateUser({required String code});

  Future<NetworkResponse<void>> resendVerificationCode({
    required String email,
  });

  Future<NetworkResponse<TokenModel>> login({
    required String login,
    required String password,
  });

  Future<NetworkResponse<TokenModel>> refresh({required String refreshToken});
}
