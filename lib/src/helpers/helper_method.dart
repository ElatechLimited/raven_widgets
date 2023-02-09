import 'package:intl/intl.dart';

class RavenHelperMethod {
  static String currencyNoSymbol(double amount) {
    var format = NumberFormat('#,##0', 'en_US');

    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      formattedAmount = format.format(amount);
    } else {
      formattedAmount = '0';
    }

    return formattedAmount;
  }
}
