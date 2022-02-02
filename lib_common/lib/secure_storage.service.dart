import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:lib_common/environments.di.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISecureStorage {
  Future<void> saveString(String key, String data);
}

@lazySingleton
class AppSecureStorage implements ISecureStorage {
  late final ISecureStorage _storage;

  AppSecureStorage(this._storage);

  Future<void> saveString(String key, String data) {
    return _storage.saveString(key, data);
  }
}

@mobileOrDesktopEnv
@Injectable(as: ISecureStorage)
class MobileSecureStorage implements ISecureStorage {
  FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> saveString(String key, String data) {
    return _storage.write(key: key, value: data);
  }
}

@webEnv
@Injectable(as: ISecureStorage)
class WebSecureStorage implements ISecureStorage {
  Future<void> saveString(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }
}

