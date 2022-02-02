import 'package:injectable/injectable.dart';
import 'package:lib_common/secure_storage.service.dart';

@singleton
class ObjectManager {
  ObjectManager(
    this._secureStorage,
  );

  final AppSecureStorage _secureStorage;

  Future<void> saveData() async {
    await _secureStorage.saveString('key', 'data');
  }
}
