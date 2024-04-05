import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_summary_edit_items_model.dart';

/// A provider class for the PackerSummaryEditItemsBottomsheet.
///
/// This provider manages the state of the PackerSummaryEditItemsBottomsheet, including the
/// current packerSummaryEditItemsModelObj
class PackerSummaryEditItemsProvider extends ChangeNotifier {
  PackerSummaryEditItemsModel packerSummaryEditItemsModelObj =
      PackerSummaryEditItemsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
