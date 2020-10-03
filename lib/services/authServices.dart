import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  GoogleSignInAccount user;
  FirebaseAuth _auth;

  AuthServices() {
    _auth = FirebaseAuth.instance;
  }

  Future<User> signIn() async {
    user = await GoogleSignIn().signIn();
    GoogleSignInAuthentication _googleAuth = await user.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);

    print(_auth.currentUser);
    return userCredential.user;
  }

}