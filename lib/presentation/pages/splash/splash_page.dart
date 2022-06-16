import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/routes.dart';
import '../../constants/asset_paths.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => context.go(Routes.homeRoute),
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          logoPNG,
          height: 175,
        ),
      ),
    );
  }
}
