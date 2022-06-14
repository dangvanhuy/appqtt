import 'package:excel_mananger/api/api.dart';
import 'package:excel_mananger/service/navigator.service.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

Future<void> locatorService() async {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerSingleton<NavigationService>(NavigationService());
}
