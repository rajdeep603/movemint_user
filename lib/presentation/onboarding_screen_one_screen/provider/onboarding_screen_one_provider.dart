import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class OnboardingScreenOneProvider extends ChangeNotifier {
  void onNextClickEvent() {
    NavigatorService.pushNamed(AppRoutes.onboardingScreenTwoScreen);
  }

  void onSkipClickEvent() {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
  }
}
