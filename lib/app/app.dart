import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/presentation/theme/app_theme.dart';

import '../core/routes/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    Routes.initialise(ref);

    return MaterialApp.router(
      title: 'Movie Box',
      theme: AppTheme.darkTheme,
      routerDelegate: Routes.routerDelegate(),
      routeInformationParser: Routes.routeInformationParser(),
    );
  }
}
