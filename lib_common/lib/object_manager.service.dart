import 'package:lib_common/secure_storage.service.dart';

class ObjectManager {
  ObjectManager(
    this._secureStorage,
  );

  final AppSecureStorage _secureStorage;

  Future<void> saveData() async {
    await _secureStorage.saveString('key', 'data');
  }

  String hello() {
    return _secureStorage.hello();
  }
}
