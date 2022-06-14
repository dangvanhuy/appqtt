import 'package:excel_mananger/common/storage.dart';
import 'package:excel_mananger/pages/login.screen.dart';
import 'package:excel_mananger/service/locator.service.dart';
import 'package:excel_mananger/service/navigator.service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

class InitViewModel extends BaseViewModel {
  final storage = new FlutterSecureStorage();

  Future<void> logout() async {
    await storage.delete(key: PHONEKEY);
    getIt.get<NavigationService>().pushReplace(LoginScreen());
  }
}
