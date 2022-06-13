import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_size.dart';
import '../../../constants/asset_paths.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.eerieBlack,
        borderRadius: BorderRadius.circular(sizes.size32),
      ),
      child: Center(
        child: SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Continue with',
                style: Theme.of(context).textTheme.headline6,
              ),
              SvgPicture.asset(
                googleLogoSVG,
                height: sizes.size24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
