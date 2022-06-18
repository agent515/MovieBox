import 'package:flutter/material.dart';
import 'package:movie_box/presentation/constants/asset_paths.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.message = 'Error'}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    errorPNG,
                    height: 250,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
