import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/providers/authentication_provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_size.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
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
                sizes.vPadding20,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(sizes.size10),
                          borderSide: BorderSide(
                            color: AppColors.darkGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(sizes.size10),
                          borderSide: BorderSide(
                            color: AppColors.red,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.darkGrey,
                      ),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
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
