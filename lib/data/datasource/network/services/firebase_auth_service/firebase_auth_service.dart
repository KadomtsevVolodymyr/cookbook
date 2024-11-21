import 'dart:developer';

import 'package:balancebyte/data/datasource/network/services/firebase_auth_service/firebase_auth_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) throw Exception('Google sign-in aborted.');

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    final String? idToken = await userCredential.user!.getIdToken();
    log(idToken.toString());
    if (idToken == null) throw Exception('Google sign-in aborted.');
    return idToken;
  }

  @override
  Future<String> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status != LoginStatus.success) {
      throw Exception('Facebook sign-in failed.');
    }

    final AuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    final String? idToken = await userCredential.user!.getIdToken();
    if (idToken == null) throw Exception('Facebook sign-in failed.');
    return idToken;
  }

  @override
  Future<String> signInWithApple() async {
    final AuthorizationCredentialAppleID appleCredential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ],
    );

    final AuthCredential credential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    final String? idToken = await userCredential.user!.getIdToken();
    if (idToken == null) throw Exception('Apple sign-in failed.');
    return idToken;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<String?> getIdToken() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return user.getIdToken();
  }
}
