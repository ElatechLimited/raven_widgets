import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

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

  static void globalPrint(value) {
    if (!kReleaseMode) {
      print(value.toString());
    }
  }

  static String getNaira(double amount) {
    var nairaInCurrentLocale = NumberFormat.currency(symbol: "₦");
    return nairaInCurrentLocale.format(amount);
  }

  static String currencyConvert(double amount, String symbol) {
    var format = NumberFormat('#,##0', 'en_US');
    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      if (symbol == 'NGN') {
        formattedAmount = '$symbol ${format.format(amount)}';
      } else {
        formattedAmount = '$symbol${format.format(amount)}';
      }
    } else {
      if (symbol == 'NGN') {
        formattedAmount = '$symbol 0';
      } else {
        formattedAmount = '${symbol}0';
      }
    }

    return formattedAmount;
  }

  static String currencyConvert2(double amount, String symbol) {
    var format = NumberFormat('#,##0.00', 'en_US');
    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      if (symbol == 'NGN') {
        formattedAmount = '$symbol ${format.format(amount)}';
      } else {
        formattedAmount = '$symbol${format.format(amount)}';
      }
    } else {
      if (symbol == 'NGN') {
        formattedAmount = '$symbol 0';
      } else {
        formattedAmount = '${symbol}0';
      }
    }

    return formattedAmount;
  }

  static String currencyNoSymbol2(double amount) {
    var format = NumberFormat('#,##0.00', 'en_US');

    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      formattedAmount = format.format(amount);
    } else {
      formattedAmount = '0.00';
    }

    return formattedAmount;
  }

  static String numberFormatter(double amount, String symbol) {
    var format = NumberFormat('#,##0.0000', 'en_US');
    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      formattedAmount = '${format.format(amount)} $symbol';
    } else {
      formattedAmount = '0 $symbol';
    }

    return formattedAmount;
  }

  static String numberFormatterSpaced(double amount, String symbol) {
    var format = NumberFormat('#,##0.00000', 'en_US');
    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      formattedAmount = '$symbol  ${format.format(amount)}';
    } else {
      formattedAmount = '$symbol  0';
    }

    return formattedAmount;
  }

  static String daVinci_CurrencyResolve(double amount) {
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

  static String roundTO(double amount, String symbol, int digits) {
    String formattedAmount;

    // checks when amount is zero or null
    if (amount != 0) {
      formattedAmount = '${amount.toStringAsFixed(digits)} $symbol';
    } else {
      formattedAmount = '0 $symbol';
    }
    return formattedAmount;
  }

  static double flooredDouble(double value, int decimalPlace) {
    String a = value.toString();
    String d = '';

    try {
      String b =
          a.substring(a.indexOf('.') + 1, a.indexOf('.') + 1 + decimalPlace);
      String c = value.truncate().toString();
      d = '$c.$b';
    } catch (ex) {
      d = value.toString();
    }

    return double.parse(d);
  }

  static String formatMyDate(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    createdAt = createdAt.add(const Duration(hours: 1));
    String formattedDate =
        '${DateFormat.MMMd().format(createdAt)}, ${DateFormat.y().format(createdAt)}. ${DateFormat.jm().format(createdAt)}';
    return formattedDate;
  }

  static String formatMyDateNoTime(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    createdAt = createdAt.add(const Duration(hours: 1));
    // String formattedDate = '${DateFormat.yMMMMEEEEd().format(createdAt)}';
    String formattedDate =
        '${DateFormat.MMMd().format(createdAt)}, ${DateFormat.y().format(createdAt)}';

    return formattedDate;
  }

  static String formatMyDateWeekDay(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    createdAt = createdAt.add(const Duration(hours: 1));
    // String formattedDate = '${DateFormat.eeee().format(createdAt)}';
    String formattedDate =
        '${DateFormat('EEEE').format(createdAt)}, ${DateFormat.MMMd().format(createdAt)}, ${DateFormat.y().format(createdAt)}';
    return formattedDate;
  }

  static String formatMyDateWithWeekDays(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    createdAt = createdAt.add(const Duration(hours: 1));
    String formattedDate = DateFormat.yMMMMEEEEd().format(createdAt);
    // String formattedDate = '${DateFormat.MMMd().format(createdAt)}, ${DateFormat.y().format(createdAt)}';

    return formattedDate;
  }

  static String formatMyDateToTimeStamp(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    String formattedDate = createdAt.millisecondsSinceEpoch.toString();
    return formattedDate;
  }

  static getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static String formatMyDatePlain(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    createdAt = createdAt.add(const Duration(hours: 1));
    var outputFormat = DateFormat('yyyy/MM/dd');
    String formattedDate = outputFormat.format(createdAt);
    return formattedDate;
  }

  static String formatMyDateForStatement(String dateString) {
    DateTime createdAt = DateTime.parse(dateString);
    var outputFormat = DateFormat('MM/dd/yyy');
    String formattedDate = outputFormat.format(createdAt);
    return formattedDate;
  }

  static String reformatDate(String dateString) {
    var createdAt = DateFormat('yyyy/MM/dd').parse(dateString);
    createdAt = createdAt.add(const Duration(hours: 1));
    String formattedDate = DateFormat.yMMMEd().format(createdAt);
    return formattedDate;
  }

  static String getDateDifferenceDays(String releaseDate) {
    var rDate = DateTime.parse(releaseDate);

    var diff = rDate.difference(DateTime.now()).inDays;

    return diff.toString();
  }

  static String getMonthsInDays(int months) {
    var thisDay = DateTime.now();

    DateTime d = Jiffy().add(months: months).dateTime;

    var diff = d.difference(DateTime.now()).inDays;

    return diff.toString();
  }

  static String getHours(theDate) {
    var thisDay = DateTime.now();
    DateTime d = Jiffy().add(hours: 6).dateTime;

    var diff = d.difference(DateTime.now()).inHours;
    return diff.toString();
  }

  static Future<bool> checkInternetConnection() async {
    bool networkStatus = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      networkStatus = false;
    } else {
      networkStatus = true;
    }

    return networkStatus;
  }
}
