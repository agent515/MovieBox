import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/providers/authentication_provider.dart';
import 'package:movie_box/presentation/providers/base_view_model.dart';

final signUpViewModel = ChangeNotifierProvider(
    (ref) => SignUpViewModel(ref.read(authenticationProvider)));

class SignUpViewModel extends BaseViewModel {
  final AuthenticationProvider _authenticationProvider;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameTextController,
      _emailTextController,
      _passwordTextController,
      _cpasswordTextController,
      _dobTextController;
  late final FocusNode _nameNode,
      _emailNode,
      _passwordNode,
      _cpasswordNode,
      _dobNode;

  SignUpViewModel(this._authenticationProvider) {
    _formKey = GlobalKey<FormState>();

    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _cpasswordTextController = TextEditingController();
    _dobTextController = TextEditingController();

    _nameNode = FocusNode();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _cpasswordNode = FocusNode();
    _dobNode = FocusNode();

    _nameNode.requestFocus();
    FocusManager.instance.addListener(_update);
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get nameTextController => _nameTextController;

  TextEditingController get emailTextController => _emailTextController;

  TextEditingController get passwordTextController => _passwordTextController;

  TextEditingController get cpasswordTextController => _cpasswordTextController;

  TextEditingController get dobTextController => _dobTextController;

  FocusNode get nameNode => _nameNode;

  FocusNode get emailNode => _emailNode;

  FocusNode get passwordNode => _passwordNode;

  FocusNode get cpasswordNode => _cpasswordNode;

  FocusNode get dobNode => _dobNode;

  void _update() => notifyListeners();

  void goToSignInPage() {
    _authenticationProvider.showSignInPage = true;
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_update);
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _cpasswordTextController.dispose();
    _dobTextController.dispose();

    _nameNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _cpasswordNode.dispose();
    _dobNode.dispose();

    super.dispose();
  }
}
