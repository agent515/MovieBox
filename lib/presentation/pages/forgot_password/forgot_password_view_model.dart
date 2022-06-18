import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/providers/authentication_provider.dart';
import 'package:movie_box/presentation/providers/base_view_model.dart';

final forgotPasswordViewModel = ChangeNotifierProvider(
    (ref) => ForgotPasswordViewModel(ref.read(authenticationProvider)));

class ForgotPasswordViewModel extends BaseViewModel {
  final AuthenticationProvider _authenticationProvider;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailTextController;
  late final FocusNode _emailNode;

  ForgotPasswordViewModel(this._authenticationProvider) {
    _formKey = GlobalKey<FormState>();
    _emailTextController = TextEditingController();
    _emailNode = FocusNode();

    _emailNode.requestFocus();
    FocusManager.instance.addListener(_update);
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailTextController => _emailTextController;

  FocusNode get emailNode => _emailNode;

  void _update() => notifyListeners();

  Future<void> send() async {
    // TODO: Implement forgot password send reset email
    loading = true;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      loading = false;
    });
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_update);
    _emailTextController.dispose();
    _emailNode.dispose();
    super.dispose();
  }
}
