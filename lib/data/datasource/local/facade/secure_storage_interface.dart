abstract interface class ISecureStorage {
  Future<void> saveToken({required String token});

  Future<String?> getToken();

  Future<void> removeToken();

  Future<void> saveRefreshToken({required String token});

  Future<String?> getRefreshToken();

  Future<void> removeRefreshToken();

  Future<bool> isTokenValid();
}
