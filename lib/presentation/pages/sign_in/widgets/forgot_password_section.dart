import 'package:flutter/material.dart';

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
            onTap: () {},
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
