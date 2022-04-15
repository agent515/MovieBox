import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/routes/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    Routes.initialise(ref);

    return MaterialApp.router(
      title: 'Movie Box',
      routerDelegate: Routes.routerDelegate(),
      routeInformationParser: Routes.routeInformationParser(),
    );
  }
}
