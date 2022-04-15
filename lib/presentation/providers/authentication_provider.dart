import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<AuthenticationProvider> authenticationProvider =
    ChangeNotifierProvider((ref) => AuthenticationProvider());

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool val) {
    _isLoggedIn = val;
    notifyListeners();
  }
}
