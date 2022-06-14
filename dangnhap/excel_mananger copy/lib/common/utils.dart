import 'package:intl/intl.dart';

class Utils {
  static const _locale = 'vi';
  static String formatNumberCurrency(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
}
