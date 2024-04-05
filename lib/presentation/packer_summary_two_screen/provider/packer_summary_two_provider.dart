import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_summary_two_model.dart';

/// A provider class for the PackerSummaryTwoScreen.
///
/// This provider manages the state of the PackerSummaryTwoScreen, including the
/// current packerSummaryTwoModelObj
class PackerSummaryTwoProvider extends ChangeNotifier {
  TextEditingController subtitleController = TextEditingController();

  PackerSummaryTwoModel packerSummaryTwoModelObj = PackerSummaryTwoModel();

  @override
  void dispose() {
    super.dispose();
    subtitleController.dispose();
  }
}
