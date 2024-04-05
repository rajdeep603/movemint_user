import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../app_export.dart';
import 'server_date_time.dart';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = DateTimeUtils.dmyFormat,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  DateTime formatInDateTime([
    String pattern = DateTimeUtils.dmyFormat,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateTime.parse(DateFormat(pattern, locale).format(this));
  }

  DateTime formatAndAddTime(
      [String pattern = DateTimeUtils.dmyFormat,
      String? locale,
      TimeOfDay? time]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    final DateTime now = ServerDateTime().dateTime;
    final DateTime dateTime = DateTime(year, month, day, time?.hour ?? now.hour,
        time?.minute ?? now.minute, now.second);
    final DateTime formattedDate =
        DateTime.parse(DateFormat(pattern, locale).format(dateTime));

    return formattedDate;
  }

  TimeOfDay? convertDateTimeToTimOfDay() {
    try {
      final TimeOfDay timeOfDay = TimeOfDay.fromDateTime(this);
      return timeOfDay;
    } on Exception catch (e) {
      Logger.logError(e);
      return null;
    }
  }
}

extension TimeOfDayExtension on TimeOfDay {
  bool isTimeBefore(TimeOfDay other) {
    if (hour < other.hour) {
      return true;
    }
    if (hour > other.hour) {
      return false;
    }
    if (minute < other.minute) {
      return true;
    }
    if (minute > other.minute) {
      return false;
    }
    return false;
  }

  String formatTimeOfDayToAMPM() {
    final DateTime now = ServerDateTime().dateTime;
    final DateTime dateTime =
        DateTime(now.year, now.month, now.day, hour, minute);
    final String formattedTime = dateTime.format(DateTimeUtils.hmAmPmFormat);
    return formattedTime;
  }

  String formatTimeOfDayToHMS() {
    final DateTime now = ServerDateTime().dateTime;
    final DateTime dateTime =
        DateTime(now.year, now.month, now.day, hour, minute);
    final String formattedTime = dateTime.format(DateTimeUtils.hmsFormat);
    return formattedTime;
  }

  int getDifferenceInMinutes(TimeOfDay endTime) {
    final DateTime now = ServerDateTime().dateTime;
    final DateTime startDate =
        DateTime(now.year, now.month, now.day, hour, minute);
    final DateTime endDate =
        DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);
    final Duration diff = endDate.difference(startDate);
    return diff.inMinutes;
  }
}

extension TimeFormatExtension on String {
  String convertTimeToAMPMFormat() {
    try {
      // Parse the input string as a time
      final DateTime dateTime = DateTime.parse('2024-01-30 $this');
      final String formattedTime = dateTime.format(DateTimeUtils.hmAmPmFormat);
      return formattedTime;
    } on Exception catch (e) {
      Logger.logError(e);
      return 'Invalid Time Format';
    }
  }

  TimeOfDay? convertTimeToTimOfDay() {
    try {
      final DateTime dateTime = DateTime.parse('2024-01-30 $this');
      final TimeOfDay timeOfDay = TimeOfDay.fromDateTime(dateTime);
      return timeOfDay;
    } on Exception catch (e) {
      Logger.logError(e);
      return null;
    }
  }
}

class DateTimeUtils {
  /// 19-01-2024 (date-month-year)
  static const String dmyFormat = 'dd-MM-yyyy';

  /// 2024-01-19 (year-month-date)
  static const String ymdFormat = 'yyyy-MM-dd';

  static const String ymdWith24TimeFormat = 'yyyy-MM-dd HH:mm:ss';

  static const String ymdWith24TimeNoSecondsFormat = 'yyyy-MM-dd HH:mm';

  static const String ymdWithAMPMTimeFormat = 'yyyy-MM-dd h:mm a';

  static const String yMonAMPMTimeFormat = 'dd MMM h:mm a';

  /// 02 January 2024 (year month name date)
  static const String dMonthYFormat = 'dd MMMM yyyy';

  /// 02 Jan 2024 (year month short name date)
  static const String dMonYFormat = 'dd MMM yyyy';

  static const String dMonFormat = 'dd MMM';

  /// 15:30:45 (24 hour format with seconds)
  static const String hmsFormat = 'HH:mm:ss';

  /// 03:30 PM (time with AM and PM)
  static const String hmAmPmFormat = 'h:mm a';

  /// F (week short name)
  static const String dayShortFormat = 'E';

  /// Friday (week name)
  static const String dayFormat = 'EEEE';

  static int getDaysInMonth(DateTime date) {
    final DateTime firstDayThisMonth =
        DateTime(date.year, date.month, date.day);
    final DateTime firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
