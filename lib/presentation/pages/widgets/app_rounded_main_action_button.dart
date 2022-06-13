import 'package:flutter/material.dart';

class AppRoundedMainActionButton extends StatelessWidget {
  const AppRoundedMainActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              fixedSize: MaterialStateProperty.all(
                const Size(double.infinity, 48),
              ),
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
