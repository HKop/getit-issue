import 'package:injectable/injectable.dart';
import 'package:lib_common/object_manager.service.dart';

@injectable
class Repo {
  late final ObjectManager objectManager;

  Repo(this.objectManager);

  String hello() {
    return objectManager.hello() + ', called from Remo';
  }
}
