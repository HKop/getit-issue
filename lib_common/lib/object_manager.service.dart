import 'package:injectable/injectable.dart';
import 'package:lib_common/secure_storage.service.dart';

@singleton
class ObjectManager {
  ObjectManager(
    // this._objectParser,
    this._secureStorage,
  );

  // final ObjectParser _objectParser;
  final AppSecureStorage _secureStorage;

  Future<void> saveData() async {
   await _secureStorage.saveString('key', 'data');
  }
}

// @injectable
// class ObjectParser {
//   String hello() {
//     return 'Hello!';
//   }
// }

