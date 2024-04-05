import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class OnboardingScreenThreeProvider extends ChangeNotifier {
  void onSkipClickEvent() {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
  }
}
