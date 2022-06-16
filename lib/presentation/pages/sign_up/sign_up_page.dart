import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/pages/sign_in/widgets/forgot_password_section.dart';

import '../../constants/app_size.dart';
import '../sign_in/widgets/sign_in_with_google.dart';
import '../widgets/app_rounded_main_action_button.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/form_divider_section.dart';
import 'sign_up_page_view_model.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late final SignUpPageViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(signUpPageViewModel);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(signUpPageViewModel);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(sizes.size16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizes.vPadding40,
                    Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    sizes.vPadding8,
                    Text(
                      'Enter the credentials below',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    sizes.vPadding40,
                    Form(
                      key: _viewModel.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextFormField(
                            focusNode: _viewModel.emailNode,
                            controller: _viewModel.emailTextController,
                            hintText: 'user@gmail.com',
                            label: const Icon(Icons.email),
                          ),
                          AppTextFormField(
                            obscureText: true,
                            focusNode: _viewModel.passwordNode,
                            controller: _viewModel.passwordTextController,
                            label: const Icon(Icons.lock),
                            hintText: 'password',
                          ),
                          AppTextFormField(
                            obscureText: true,
                            focusNode: _viewModel.cpasswordNode,
                            controller: _viewModel.cpasswordTextController,
                            label: const Icon(Icons.lock),
                            hintText: 'confirm password',
                          ),
                          AppRoundedMainActionButton(
                            text: 'Sign up',
                            onPressed: () => {},
                          ),
                          const FormDividerSection(),
                          const SignInWithGoogle(),
                          sizes.vPadding20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already a user?',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              sizes.hPadding8,
                              InkWell(
                                onTap: () => _viewModel.goToSignInPage(),
                                child: Text(
                                  'Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
