import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();
  Future<UserCredential> signInGoogle() => _firebaseAuthAPI.signInWithGoogle();
  Future<UserCredential> signInEmail(email, password) => _firebaseAuthAPI.signInWithEmail(email, password);
  signOut() => _firebaseAuthAPI.signOut();
}