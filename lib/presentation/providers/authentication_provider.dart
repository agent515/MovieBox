import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<AuthenticationProvider> authenticationProvider =
    ChangeNotifierProvider((ref) => AuthenticationProvider());

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _showSignInPage = true;

  bool get isLoggedIn => _isLoggedIn;

  bool get showSignInPage => _showSignInPage;

  set isLoggedIn(bool val) {
    _isLoggedIn = val;
    notifyListeners();
  }

  set showSignInPage(bool val) {
    _showSignInPage = val;
    notifyListeners();
  }
}
