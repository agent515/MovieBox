import 'package:flutter/material.dart';

import '../../constants/app_size.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String labelText;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          sizes.vPadding8,
          TextFormField(
            obscureText: obscureText,
            obscuringCharacter: '●',
            focusNode: focusNode,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              label: label != null
                  ? Theme(
                      data: Theme.of(context).copyWith(
                          iconTheme: IconThemeData(
                        color: focusNode!.hasFocus
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                      )),
                      child: label!,
                    )
                  : null,
            ),
            style: Theme.of(context).textTheme.bodyText2,
            onFieldSubmitted: onFieldSubmitted,
          ),
        ],
      ),
    );
  }
}
