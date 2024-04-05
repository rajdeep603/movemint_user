import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/wellcome_model.dart';

/// A provider class for the WellcomeScreen.
///
/// This provider manages the state of the WellcomeScreen, including the
/// current wellcomeModelObj

// ignore_for_file: must_be_immutable
class WellcomeProvider extends ChangeNotifier {
  WellcomeModel wellcomeModelObj = WellcomeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
