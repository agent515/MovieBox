import 'package:flutter/material.dart';
import 'package:movie_box/presentation/constants/asset_paths.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              errorPNG,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text('Error'),
        ],
      ),
    );
  }
}
