import 'package:fluttertoast/fluttertoast.dart';

import 'enums.dart';

class ToastHelper {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      fontSize: 16.0,
    );
  }

  static void somethingWentWrong() {
    Fluttertoast.showToast(
      msg: CustomException.unknownError.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      fontSize: 16.0,
    );
  }

  static Future<void> cancelAllToast() async {
    await Fluttertoast.cancel();
  }
}
