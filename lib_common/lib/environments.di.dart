import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

const Environment webEnv = Environment('web');
const Environment mobileOrDesktopEnv = Environment('mobileOrDesktop');
