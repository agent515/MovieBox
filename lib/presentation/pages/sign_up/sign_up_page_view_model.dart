import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/providers/authentication_provider.dart';
import 'package:movie_box/presentation/providers/base_view_model.dart';

final signUpPageViewModel = ChangeNotifierProvider(
    (ref) => SignUpPageViewModel(ref.read(authenticationProvider)));

class SignUpPageViewModel extends BaseViewModel {
  final AuthenticationProvider _authenticationProvider;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailTextController,
      _passwordTextController,
      _cpasswordTextController;
  late final FocusNode _emailNode, _passwordNode, _cpasswordNode;

  SignUpPageViewModel(this._authenticationProvider) {
    _formKey = GlobalKey<FormState>();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _cpasswordTextController = TextEditingController();

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _cpasswordNode = FocusNode();

    _emailNode.requestFocus();
    FocusManager.instance.addListener(_update);
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailTextController => _emailTextController;

  TextEditingController get passwordTextController => _passwordTextController;

  TextEditingController get cpasswordTextController => _cpasswordTextController;

  FocusNode get emailNode => _emailNode;

  FocusNode get passwordNode => _passwordNode;

  FocusNode get cpasswordNode => _cpasswordNode;

  void _update() => notifyListeners();

  void goToSignInPage() {
    _authenticationProvider.showSignInPage = true;
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_update);
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _cpasswordTextController.dispose();

    _emailNode.dispose();
    _passwordNode.dispose();
    _cpasswordNode.dispose();

    super.dispose();
  }
}
