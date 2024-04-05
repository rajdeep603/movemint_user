import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_summary_one_model.dart';

/// A provider class for the PackerSummaryOneScreen.
///
/// This provider manages the state of the PackerSummaryOneScreen, including the
/// current packerSummaryOneModelObj

// ignore_for_file: must_be_immutable
class PackerSummaryOneProvider extends ChangeNotifier {
  TextEditingController subtitleController = TextEditingController();

  PackerSummaryOneModel packerSummaryOneModelObj = PackerSummaryOneModel();

  @override
  void dispose() {
    super.dispose();
    subtitleController.dispose();
  }
}
