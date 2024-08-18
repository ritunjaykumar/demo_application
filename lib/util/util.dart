import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
abstract final class Util {
  static const String _fixedDateFormat = 'dd-MM-yyyy';

  static DateFormat getDateFormatter([String format = _fixedDateFormat]) {
    try {
      return DateFormat(format);
    } catch (error) {
      return DateFormat(_fixedDateFormat);
    }
  }

  static void debugLog(String log) {
    debugPrint(log);
  }
}
