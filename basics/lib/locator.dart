import 'package:get_it/get_it.dart';
import 'package:basics/services/navigation_service.dart';
import 'package:basics/services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}
