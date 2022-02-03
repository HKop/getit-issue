import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'injectable.init.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

Future<void> configureDependencies() async =>
    $initGetIt(getIt, environment: kIsWeb ? 'web' : 'mobileOrDesktop');
