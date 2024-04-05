import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/services/api_services.dart';
import '../../domain/services/common_api_call.dart';
import 'date_time_utils.dart';
import 'logger.dart';


class ServerDateTime {
  factory ServerDateTime() {
    return _singleton;
  }

  ServerDateTime._internal();

  static final ServerDateTime _singleton = ServerDateTime._internal();

  late DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  late TimeOfDay _timeOfDay;

  TimeOfDay get timeOfDay => _timeOfDay;

  late Timer _timer;

  bool isDateTimeFetch = false;

  Future<void> fetchDateTimeFromServer() async {
    try {
      _dateTime = DateTime.now();
      _timeOfDay = TimeOfDay.now();
      // final CustomResponse customResponse = await ApiServices().getDateTime();
      // if (customResponse.response == null || customResponse.statusCode != 200) {
      //   isDateTimeFetch = false;
      //   Logger.logError(customResponse.error.message);
      //   _dateTime = DateTime.now();
      //   _timeOfDay = TimeOfDay.now();
      //   return;
      // }
      // _dateTime = DateTime.parse(customResponse.response!.data);
      // isDateTimeFetch = true;
    } on Exception catch (e) {
      isDateTimeFetch = false;
      _dateTime = DateTime.now();
      _timeOfDay = TimeOfDay.now();
      Logger.logError(e);
    } finally {
      _startTimer();
    }
  }

  void _startTimer() {
    // _timer = Timer.periodic(const Duration(seconds: 1), (Timer getTimer) {
    //   if (isDateTimeFetch == false && getTimer.tick % 60 == 0) {
    //     fetchDateTimeFromServer();
    //   }
    //   _dateTime = _dateTime.add(const Duration(seconds: 1));
    //   _timeOfDay = _dateTime.convertDateTimeToTimOfDay() ?? TimeOfDay.now();
    // });
  }

  void dispose() {
    _timer.cancel();
  }
}
