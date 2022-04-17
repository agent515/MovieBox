import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getIt = GetIt.I;

@InjectableInit()
Future injectDependencies() async => $initGetIt(getIt);
