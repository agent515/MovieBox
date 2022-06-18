import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../constants/app_size.dart';

class ForgotPasswordSection extends StatelessWidget {
  const ForgotPasswordSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: sizes.size16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => context.go('/' + Routes.forgotPasswordRoute),
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.headline6!,
            ),
          ),
        ],
      ),
    );
  }
}
