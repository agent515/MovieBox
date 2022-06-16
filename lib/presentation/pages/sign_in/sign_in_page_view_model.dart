import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/providers/authentication_provider.dart';
import 'package:movie_box/presentation/providers/base_view_model.dart';

final signInPageViewModel = ChangeNotifierProvider(
    (ref) => SignInPageViewModel(ref.read(authenticationProvider)));

class SignInPageViewModel extends BaseViewModel {
  final AuthenticationProvider _authenticationProvider;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailTextController,
      _passwordTextController;
  late final FocusNode _emailNode, _passwordNode;

  SignInPageViewModel(this._authenticationProvider) {
    _formKey = GlobalKey<FormState>();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();

    _emailNode.requestFocus();
    FocusManager.instance.addListener(_update);
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailTextController => _emailTextController;

  TextEditingController get passwordTextController => _passwordTextController;

  FocusNode get emailNode => _emailNode;

  FocusNode get passwordNode => _passwordNode;

  void _update() => notifyListeners();

  void goToSignUpPage() {
    _authenticationProvider.showSignInPage = false;
  }

  Future<void> signIn() async {
    // TODO: Implement sign in
    loading = true;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      loading = false;
      _authenticationProvider.isLoggedIn = true;
    });
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_update);
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }
}
