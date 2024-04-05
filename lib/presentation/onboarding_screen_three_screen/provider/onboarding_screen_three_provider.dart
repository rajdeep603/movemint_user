import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/onboarding_screen_three_model.dart';

/// A provider class for the OnboardingScreenTwoScreen.
///
/// This provider manages the state of the OnboardingScreenTwoScreen, including the
/// current onboardingScreenTwoModelObj
class OnboardingScreenThreeProvider extends ChangeNotifier {
  OnboardingScreenThreeModel onboardingScreenTwoModelObj =
      OnboardingScreenThreeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
