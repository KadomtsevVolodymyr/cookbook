abstract class IFirebaseAuthService {
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
  Future<String> signInWithApple();
  Future<void> signOut();
  Future<String?> getIdToken();
}
