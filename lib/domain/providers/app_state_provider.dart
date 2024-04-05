import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class AppStateProvider extends ChangeNotifier {
  bool isNoInternetScreenOpen = false;

  bool isSeverErrorScreenOpen = false;

  void onGoBack() {
    if (NavigatorService.canPop()) {
      NavigatorService.goBack();
    }
  }
  @override
  void notifyListeners() {
    if (hasListeners) {
      if (NavigatorService.navigatorKey.currentState?.mounted ?? false) {
        super.notifyListeners();
      }
    }
  }
}
