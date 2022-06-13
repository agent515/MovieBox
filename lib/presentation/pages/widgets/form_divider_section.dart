import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_size.dart';

class FormDividerSection extends StatelessWidget {
  const FormDividerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizes.size32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizes.size16),
            child: Text(
              'Or',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
