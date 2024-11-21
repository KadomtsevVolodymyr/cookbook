import 'package:balancebyte/data/datasource/network/api/authentication/authentication_api_interface.dart';
import 'package:balancebyte/data/datasource/network/exchange_models/request.dart';
import 'package:balancebyte/data/datasource/network/exchange_models/response.dart';
import 'package:balancebyte/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:balancebyte/data/model/token_model.dart';

class AuthenticationApi implements IAuthenticationApi {
  AuthenticationApi({
    required INetworkService networkService,
  }) : _networkService = networkService;
  final INetworkService _networkService;

  static const String _authPath = "auth";
  static const String _oAuthPath = "$_authPath/oauth/login";
  static const String _signUpPath = "$_authPath/signup";
  static const String _activateUserPath = "$_authPath/activate-user";
  static const String _resendVerificationCodePath = "$_authPath/resend-code";
  static const String _loginPath = "$_authPath/login";
  static const String _refreshPath = "$_authPath/refresh";

  @override
  Future<NetworkResponse<TokenModel>> exchangeFirebaseTokenForAppToken() async {
    return _networkService.request(
      const NetworkRequest(
        method: NetworkRequestType.post,
        path: _oAuthPath,
      ),
      onParse: (response) {
        final token =
            TokenModel.fromJson(response.data as Map<String, dynamic>);
        return token;
      },
    );
  }

  @override
  Future<NetworkResponse<void>> signUp({
    required String email,
    required String password,
  }) async {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.post,
        path: _signUpPath,
        data: {
          "email": email,
          "password": password,
        },
      ),
      onParse: (response) {
        return response;
      },
    );
  }

  @override
  Future<NetworkResponse<TokenModel>> activateUser({
    required String code,
  }) async {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.post,
        path: "$_activateUserPath?code=$code",
      ),
      onParse: (response) {
        return TokenModel.fromJson(response.data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<NetworkResponse<String>> resendVerificationCode({
    required String email,
  }) async {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.post,
        path: "$_resendVerificationCodePath?email=$email",
      ),
      onParse: (response) {
        return response;
      },
    );
  }

  @override
  Future<NetworkResponse<TokenModel>> login({
    required String login,
    required String password,
  }) async {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.post,
        path: _loginPath,
        data: {
          "login": login,
          "password": password,
        },
      ),
      onParse: (response) {
        return TokenModel.fromJson(response.data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<NetworkResponse<TokenModel>> refresh({
    required String refreshToken,
  }) async {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.post,
        path: _refreshPath,
        data: {
          "refresh_token": refreshToken,
        },
      ),
      onParse: (response) {
        return TokenModel.fromJson(response as Map<String, dynamic>);
      },
    );
  }
}
