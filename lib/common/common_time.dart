import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CommonTime{

  static const String dateTimeFormat = "yyyy-MM-dd HH:mm:ss";
  static const String dateTimeFormat12Hours = "yyyy-MM-dd hh:mm a";
  static const String dateFormat = "yyyy-MM-dd";
  static const String timeFormat = "HH:mm:ss";
  static const Locale defaultLocale = Locale('en', "US");

  /// get unix milliseconds time stamp for current
  static int currentMillisecondsTimeStamp() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  /// get unix seconds time stamp for current
  static int currentTimeStamp() {
    final milliseconds =  new DateTime.now().millisecondsSinceEpoch;
    return (milliseconds ~/ 1000).toInt();
  }

  /// parse time str to DataTime with local
  /// default locale is en_US
  /// eg. 2019-11-06 15:29:33
  static DateTime parseDateTimeStr(String strDateTime, {Locale locale = defaultLocale, String strFormat = dateTimeFormat}) {
    final format = new DateFormat(strFormat, locale.languageCode + '_' + locale.countryCode);
    return format.parse(strDateTime);
  }

  /// DateTime convert to str
  /// default locale is en_US
  /// default format is yyyy-MM-dd HH:mm:ss
  static String dateTimeToStr(DateTime dateTime, {Locale locale = defaultLocale, String strFormat = dateTimeFormat}) {
    final format = new DateFormat(strFormat, locale.languageCode + '_' + locale.countryCode);
    return format.format(dateTime);
  }

  /// unix time stamp convert to string time
  /// default locale is en_US
  /// default format is yyyy-MM-dd HH:mm:ss
  static String timeStampToStr(int timestamp, {Locale locale = defaultLocale, String strFormat = dateTimeFormat}) {
    int time = timestamp;
    if(timestamp.toString().length == 10){
      time = timestamp * 1000;
    }
    var format = new DateFormat(strFormat, locale.languageCode + '_' + locale.countryCode);
    var date = new DateTime.fromMillisecondsSinceEpoch(time);
    return format.format(date);
  }


  /// unix time stamp convert to wrapped str
  /// default locale is en_US
  /// default format is yyyy-MM-dd HH:mm:ss
  static String timeStampToStrWrapped(int timestamp, {Locale locale = defaultLocale, String strFormat = dateTimeFormat}) {
    var now = new DateTime.now();
    var format = new DateFormat(strFormat, locale.languageCode + '_' + locale.countryCode);
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }
    return time;
  }


  /// compute different days between dateTime a and b
  static int diffDays(DateTime a, DateTime b, [bool ignoreTime = false]) {
    if (ignoreTime) {
      int v = a.millisecondsSinceEpoch ~/ 86400000 -
          b.millisecondsSinceEpoch ~/ 86400000;
      if (v < 0) return -v;
      return v;
    } else {
      int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
      if (v < 0) v = -v;
      return v ~/ 86400000;
    }
  }

  /// get the start and end unix time of the day
  static TimeStampOfDay getStartAndEndTimeOfDay(DateTime dateTime){
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;
    int startTime = DateTime(year, month, day, 0, 0, 0, 0, 0).millisecondsSinceEpoch ~/ 1000;
    int endTime = DateTime(year, month, day, 23, 59, 59, 0, 0).millisecondsSinceEpoch ~/ 1000;
    return TimeStampOfDay(startTime, endTime);
  }


}

class TimeStampOfDay{

  int start;
  int end;

  TimeStampOfDay(this.start, this.end);

  @override
  String toString() {
    return 'TimeOfDay{start: $start, end: $end}';
  }


}