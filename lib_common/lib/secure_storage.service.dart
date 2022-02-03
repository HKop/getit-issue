import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSecureStorage implements ISecureStorage {
  late final ISecureStorage _storage;

  AppSecureStorage(this._storage);

  Future<void> saveString(String key, String data) {
    return _storage.saveString(key, data);
  }

  @override
  String hello() {
    return _storage.hello();
  }

}

abstract class ISecureStorage {
  Future<void> saveString(String key, String data);
  String hello();
}

class MobileSecureStorage implements ISecureStorage {
  FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> saveString(String key, String data) {
    return _storage.write(key: key, value: data);
  }

  @override
  String hello() {
    return 'Hello from MobileSecureStorage';
  }
}

class WebSecureStorage implements ISecureStorage {
  Future<void> saveString(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  @override
  String hello() {
    return 'Hello from WebSecureStorage';
  }
}
