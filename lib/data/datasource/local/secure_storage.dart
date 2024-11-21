import 'package:balancebyte/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements ISecureStorage {
  SecureStorage({required secureStorage}) : _secureStorage = secureStorage;

  static const _accessTokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token_key";

  final FlutterSecureStorage _secureStorage;

  //
  // Access token
  //
  @override
  Future<String?> getToken() async => _secureStorage.read(key: _accessTokenKey);

  @override
  Future<void> saveToken({required String token}) async => _secureStorage.write(
        key: _accessTokenKey,
        value: token,
      );

  @override
  Future<void> removeToken() async =>
      _secureStorage.delete(key: _accessTokenKey);

  //
  // Refresh token
  //
  @override
  Future<String?> getRefreshToken() async =>
      await _secureStorage.read(key: _refreshTokenKey);

  @override
  Future<void> removeRefreshToken() async =>
      await _secureStorage.delete(key: _refreshTokenKey);

  @override
  Future<void> saveRefreshToken({required String token}) async =>
      await _secureStorage.write(
        key: _refreshTokenKey,
        value: token,
      );

  @override
  Future<bool> isTokenValid() async {
    final String? token = await _secureStorage.read(key: _accessTokenKey);
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
