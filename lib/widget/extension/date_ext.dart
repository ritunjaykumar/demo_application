

import 'package:demo_application/util/util.dart';

extension DateTimeExt on DateTime {
  String get ddmmyyy => Util.getDateFormatter().format(this);

  String get time => Util.getDateFormatter('hh:mm').format(this);

  String get timeAP => Util.getDateFormatter('hh:mm a').format(this);

  String get timeSecond => Util.getDateFormatter('hh:mm:ss').format(this);

  String get monthName => Util.getDateFormatter('MMM').format(this);

  String get indDateFormat => Util.getDateFormatter('dd-MM-yyyy hh:mm:ss').format(this);

  String get dateDayFormat => Util.getDateFormatter('E, MMM dd').format(this);
}

