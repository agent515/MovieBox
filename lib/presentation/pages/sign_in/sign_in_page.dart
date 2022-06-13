import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_box/presentation/constants/asset_paths.dart';
import 'package:movie_box/presentation/pages/sign_in/widgets/forgot_password_section.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_size.dart';
import '../widgets/app_rounded_main_action_button.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/form_divider_section.dart';
import 'widgets/sign_in_with_google.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3)).then(
    //   (value) => ref.read(authenticationProvider).isLoggedIn = true,
    // );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(sizes.size16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizes.vPadding20,
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headline3,
                ),
                sizes.vPadding40,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextFormField(
                      focusNode: _emailNode,
                      controller: _emailTextController,
                      hintText: 'user@gmail.com',
                      label: const Icon(Icons.email),
                    ),
                    AppTextFormField(
                      obscureText: true,
                      focusNode: _passwordNode,
                      controller: _passwordTextController,
                      label: const Icon(Icons.lock),
                    ),
                    const ForgotPasswordSection(),
                    AppRoundedMainActionButton(
                      text: 'Sign in',
                      onPressed: () => {},
                    ),
                    const FormDividerSection(),
                    const SignInWithGoogle()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
