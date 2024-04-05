import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/onboarding_screen_one_model.dart';

/// A provider class for the OnboardingScreenOneScreen.
///
/// This provider manages the state of the OnboardingScreenOneScreen, including the
/// current onboardingScreenOneModelObj
class OnboardingScreenOneProvider extends ChangeNotifier {
  OnboardingScreenOneModel onboardingScreenOneModelObj =
      OnboardingScreenOneModel();

  @override
  void dispose() {
    super.dispose();
  }
}
