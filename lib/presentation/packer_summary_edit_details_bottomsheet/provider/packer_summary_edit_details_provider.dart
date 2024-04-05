import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_summary_edit_details_model.dart';

/// A provider class for the PackerSummaryEditDetailsBottomsheet.
///
/// This provider manages the state of the PackerSummaryEditDetailsBottomsheet, including the
/// current packerSummaryEditDetailsModelObj
class PackerSummaryEditDetailsProvider extends ChangeNotifier {
  PackerSummaryEditDetailsModel packerSummaryEditDetailsModelObj =
      PackerSummaryEditDetailsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
