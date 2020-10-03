import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class LoggedInUser extends ChangeNotifier {
  bool _isLoggedIn = false;
  User _user;
  String _id;

  LoggedInUser(String id) {
    if (id != null) {
      this._id = id;
      signInFirebaseuser(id);
    }
  }

  User get getUser => _user;
  bool get isLoggedIn => _isLoggedIn;

  void signIn(User user) {
    this._user = user;
    this._id = _user.uid;
    this._isLoggedIn = true;
    notifyListeners();
  }

  void signOut() {
    _isLoggedIn = false;
    _user = null;
    this._id = null;
    notifyListeners();
  }

  Future<void> signInFirebaseuser(String id) async {
    UserCredential credential = await _auth.signInWithCustomToken(id);
    _user = credential.user;
    if (_user == null) {
      _isLoggedIn = false;
      this._id = null;
    }
    this._id = _user.uid;
    _isLoggedIn = true;
    notifyListeners();
  }
}
