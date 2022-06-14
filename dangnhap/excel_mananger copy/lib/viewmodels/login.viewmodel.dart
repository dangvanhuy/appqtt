import 'package:excel_mananger/api/api.dart';
import 'package:excel_mananger/common/storage.dart';
import 'package:excel_mananger/pages/init.screen.dart';
import 'package:excel_mananger/service/locator.service.dart';
import 'package:excel_mananger/service/navigator.service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final storage = new FlutterSecureStorage();
  bool isLoginSuccess = false;
  List<String> listPhone = [];
  Future<void> init() async {
    var ss = await ApiClient.getWorksheetByTitle("Form-NhapTT");
    if (ss != null) {
      final cell = await ss.values.column(4);
      cell.map((e) {
        if (e != "Số điện thoại") {
          listPhone.add(e);
        }
      }).toList();
    }
    print(listPhone);

    var phoneExist = await storage.read(key: PHONEKEY);
    if (phoneExist != null) {
      var phoneTmp = listPhone.firstWhere((element) => element == phoneExist);
      if (phoneTmp != null) {
        isLoginSuccess = true;
        await storage.write(key: PHONEKEY, value: phoneTmp);
        getIt.get<NavigationService>().push(InitScreen());
      }
    }
    notifyListeners();
  }

  Future<void> loginEvent(String phone) async {
    if (phone.isNotEmpty) {
      var phoneTmp = listPhone.firstWhere((element) => element == phone);
      if (phoneTmp != null) {
        isLoginSuccess = true;
        await storage.write(key: PHONEKEY, value: phoneTmp);
        getIt.get<NavigationService>().push(InitScreen());
      }
    }
  }
}
