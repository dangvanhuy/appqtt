import 'package:excel_mananger/api/api.dart';
import 'package:excel_mananger/service/locator.service.dart';

class GsheetService {
  final gsheets = getIt.get<ApiClient>();
}
