import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_common/object_manager.service.dart';
import 'package:lib_common/secure_storage.service.dart';

// final GetIt getIt = GetIt.instance;


void registerLibDependencies(GetIt getIt ) {
  getIt.registerFactory<ISecureStorage>(() => kIsWeb ? WebSecureStorage() : MobileSecureStorage());

  getIt.registerLazySingleton<AppSecureStorage>(() {
    return AppSecureStorage(GetIt.I.get<ISecureStorage>());
  });

  getIt.registerSingleton<ObjectManager>(ObjectManager(GetIt.I.get<AppSecureStorage>()));
}
