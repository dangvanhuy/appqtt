import 'dart:async';

import 'package:excel_mananger/api/api.dart';
import 'package:stacked/stacked.dart';

class Page1Viewmodel extends BaseViewModel {
  int sum = 0;
  List<int> sumTmp = [];

  Future<void> getSum() async {
    sumTmp = [];
    sum = 0;
    var ss = await ApiClient.getWorksheetByTitle("Form-NhapTT");
    if (ss != null) {
      final cell = await ss.values.column(7);
      cell.map((e) {
        if (e != "Số tiền") {
          sumTmp.add(int.tryParse(e)!);
        }
      }).toList();

      sumTmp.map((e) {
        sum += e;
      }).toList();
    }

    notifyListeners();
  }
}
