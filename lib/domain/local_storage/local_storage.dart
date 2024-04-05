import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../core/utils/logger.dart';
import 'hive_keys.dart';

class LocalStorage {
  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._internal();

  static final LocalStorage _singleton = LocalStorage._internal();

  //* ============================================================================================== *//

  static Future<void> initialize() async {
    final Directory appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    _registerAllAdapter();
    _createEncryptionKey();
    await _openAllBoxes();
    Logger.log('Hive Initialized');
  }

//* ============================================================================================== *//

  static void _registerAllAdapter() {}

//* ============================================================================================== *//

  static void _createEncryptionKey() {}

//* ============================================================================================== *//

  static Future<void> _openAllBoxes() async {
    await Future.wait(<Future<void>>[
      _openTokenBox(), // 1
      _openMobileNoBox(), //2
    ]);
  }

  //* ============================================================================================== *//

  static Future<void> clearAllBoxes() async {
    await Future.wait(<Future<void>>[
      clearTokenBox(), //1
      clearMobileBox(), //2
    ]);
  }

//* ============================================== 1 ============================================== *//

  static Future<void> _openTokenBox() async {
    await Hive.openBox<String>(HiveKeys.token);
  }

  static Future<void> saveToken(String token) async {
    final Box<String> box = Hive.box<String>(HiveKeys.token);
    box.put(HiveKeys.token, token);
  }

  static String? getToken() {
    final Box<String> box = Hive.box<String>(HiveKeys.token);
    final String? token = box.get(HiveKeys.token);
    return token;
  }

  static Future<void> clearTokenBox() async {
    final Box<String> box = Hive.box<String>(HiveKeys.token);
    await box.clear();
  }

//* =================================================== 2 ========================================= *//

  static Future<void> _openMobileNoBox() async {
    await Hive.openBox<String>(HiveKeys.mobileNo);
  }

  static Future<void> saveMobileNo(String token) async {
    final Box<String> box = Hive.box<String>(HiveKeys.mobileNo);
    box.put(HiveKeys.mobileNo, token);
  }

  static String? getMobileNo() {
    final Box<String> box = Hive.box<String>(HiveKeys.mobileNo);
    final String? mobileNo = box.get(HiveKeys.mobileNo);
    return mobileNo;
  }

  static Future<void> clearMobileBox() async {
    final Box<String> box = Hive.box<String>(HiveKeys.mobileNo);
    await box.clear();
  }
}
