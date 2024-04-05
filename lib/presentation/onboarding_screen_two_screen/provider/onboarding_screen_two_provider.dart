import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/onboarding_screen_two_model.dart';

/// A provider class for the OnboardingScreenTwoScreen.
///
/// This provider manages the state of the OnboardingScreenTwoScreen, including the
/// current onboardingScreenTwoModelObj
class OnboardingScreenTwoProvider extends ChangeNotifier {
  OnboardingScreenTwoModel onboardingScreenTwoModelObj =
      OnboardingScreenTwoModel();

  @override
  void dispose() {
    super.dispose();
  }
}
