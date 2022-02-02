import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:lib_common/environments.di.dart';
import 'package:lib_common/object_manager.service.dart';
import 'package:lib_common/secure_storage.service.dart';
import 'injectable.init.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

//Registering classes from lib_common
@module
abstract class LibCommonModule {
  // @injectable
  // ObjectParser get objectParser;

  @webEnv
  @Injectable(as: ISecureStorage)
  WebSecureStorage get webSecureStorage;

  @mobileOrDesktopEnv
  @Injectable(as: ISecureStorage)
  MobileSecureStorage get mobileSecureStorage;

  @lazySingleton
  AppSecureStorage get appSecureStorage;

  @singleton
  ObjectManager get objectManager;
}

Future<void> configureDependencies() async => $initGetIt(getIt, environment: kIsWeb ? 'web' : 'mobileOrDesktop');
