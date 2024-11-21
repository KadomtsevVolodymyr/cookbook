import 'package:balancebyte/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:balancebyte/data/datasource/network/api/authentication/authentication_api_interface.dart';
import 'package:balancebyte/data/datasource/network/services/firebase_auth_service/firebase_auth_service_interface.dart';
import 'package:balancebyte/data/model/token_model.dart';
import 'package:balancebyte/domain/entities/result.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final IFirebaseAuthService _firebaseAuthService;
  final IAuthenticationApi _authenticationApi;
  final ISecureStorage _secureStorage;

  AuthRepository({
    required IFirebaseAuthService firebaseAuthService,
    required IAuthenticationApi authenticationApi,
    required ISecureStorage secureStorage,
  })  : _firebaseAuthService = firebaseAuthService,
        _authenticationApi = authenticationApi,
        _secureStorage = secureStorage;

  @override
  Future<Result<TokenModel>> loginWithGoogle() async {
    final firebaseToken = await _firebaseAuthService.signInWithGoogle();
    await _secureStorage.saveToken(token: firebaseToken);
    final data = await _authenticationApi.exchangeFirebaseTokenForAppToken();
    await _secureStorage.removeToken();
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<TokenModel>> loginWithFacebook() async {
    final firebaseToken = await _firebaseAuthService.signInWithFacebook();
    final data = await _authenticationApi.exchangeFirebaseTokenForAppToken();
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<TokenModel>> loginWithApple() async {
    final firebaseToken = await _firebaseAuthService.signInWithApple();
    final data = await _authenticationApi.exchangeFirebaseTokenForAppToken();
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> signUp({
    required String email,
    required String password,
  }) async {
    final data =
        await _authenticationApi.signUp(email: email, password: password);
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<TokenModel>> activateUser({required String code}) async {
    final data = await _authenticationApi.activateUser(code: code);
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> resendVerificationCode({required String email}) async {
    final data = await _authenticationApi.resendVerificationCode(email: email);
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<TokenModel>> login({
    required String login,
    required String password,
  }) async {
    final data =
        await _authenticationApi.login(login: login, password: password);
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<TokenModel>> refresh({required String refreshToken}) async {
    final data = await _authenticationApi.refresh(refreshToken: refreshToken);
    return data.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuthService.signOut();
    await _secureStorage.removeToken();
    await _secureStorage.removeRefreshToken();
  }

  @override
  Future<void> saveToken(TokenModel token) async {
    await _secureStorage.saveToken(token: token.accessToken);
    await _secureStorage.saveRefreshToken(token: token.accessToken);
  }
}
