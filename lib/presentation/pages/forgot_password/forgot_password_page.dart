import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_box/presentation/pages/forgot_password/forgot_password_view_model.dart';

import '../../constants/app_size.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/app_rounded_main_action_button.dart';
import '../widgets/app_text_form_field.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  late final ForgotPasswordViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(forgotPasswordViewModel);
  }

  @override
  Widget build(BuildContext context) {
    final _viewModelWatch = ref.watch(forgotPasswordViewModel);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: BackButton(
                        onPressed: () => context.pop(),
                      ),
                    ),
                    sizes.vPadding40,
                    Padding(
                      padding: EdgeInsets.all(sizes.size16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot Password',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          sizes.vPadding8,
                          Text(
                            'Enter your email-id',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          sizes.vPadding40,
                          Center(
                            child: Form(
                              key: _viewModel.formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextFormField(
                                    labelText: 'Email',
                                    focusNode: _viewModel.emailNode,
                                    controller: _viewModel.emailTextController,
                                    hintText: 'user@gmail.com',
                                    label: const Icon(Icons.email),
                                  ),
                                  AppRoundedMainActionButton(
                                    text: 'Send',
                                    onPressed: () => _viewModel.send(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_viewModelWatch.loading) const AppLoadingIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
