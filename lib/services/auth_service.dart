import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future signInGoogle() async {
    try {
      final result = await googleSignIn.signIn();

      final auth = await result?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );

      final authResult = await _auth.signInWithCredential(credential);

      final user = authResult.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }

  Future<User?> get currentUser async => _auth.currentUser;
}
