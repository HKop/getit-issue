// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lib_common/object_manager.service.dart' as _i4;
import 'package:lib_common/secure_storage.service.dart' as _i3;

import 'injectable.init.dart' as _i5;

const String _web = 'web';
const String _mobileOrDesktop = 'mobileOrDesktop';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final libCommonModule = _$LibCommonModule(get);
  gh.factory<_i3.ISecureStorage>(() => libCommonModule.webSecureStorage,
      registerFor: {_web});
  gh.factory<_i3.ISecureStorage>(() => libCommonModule.mobileSecureStorage,
      registerFor: {_mobileOrDesktop});
  gh.lazySingleton<_i3.AppSecureStorage>(
      () => libCommonModule.appSecureStorage);
  gh.singleton<_i4.ObjectManager>(libCommonModule.objectManager);
  return get;
}

class _$LibCommonModule extends _i5.LibCommonModule {
  _$LibCommonModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.WebSecureStorage get webSecureStorage => _i3.WebSecureStorage();
  @override
  _i3.MobileSecureStorage get mobileSecureStorage => _i3.MobileSecureStorage();
  @override
  _i3.AppSecureStorage get appSecureStorage =>
      _i3.AppSecureStorage(_getIt<_i3.ISecureStorage>());
  @override
  _i4.ObjectManager get objectManager =>
      _i4.ObjectManager(_getIt<_i3.AppSecureStorage>());
}
