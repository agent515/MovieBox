import 'package:flutter/material.dart';

import '../../constants/app_size.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String? hintText;
  final Widget? label;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: sizes.size16),
      child: TextFormField(
        obscureText: obscureText,
        obscuringCharacter: '●',
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          label: label,
        ),
        style: Theme.of(context).textTheme.bodyText2,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
