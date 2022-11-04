import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? gSA = await googleSignInAccount?.authentication;

    final user = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(accessToken: gSA?.accessToken, idToken: gSA?.idToken)
    );

    return user;
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return authResult;
  }

  signOut() async {
    await _auth.signOut().then((value) => print('Sesion Cerrada'));
    googleSignIn.signOut();
    print('Sesiones Cerradas');
  }

}