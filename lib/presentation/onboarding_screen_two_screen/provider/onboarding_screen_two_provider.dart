import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/onboarding_screen_two_model.dart';

class OnboardingScreenTwoProvider extends ChangeNotifier {
  void onNextClickEvent() {
    NavigatorService.pushNamed(AppRoutes.onboardingScreenThreeScreen);
  }

  void onSkipClickEvent() {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
  }
}
