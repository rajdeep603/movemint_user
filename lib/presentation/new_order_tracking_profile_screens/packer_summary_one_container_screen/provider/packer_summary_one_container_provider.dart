import 'package:flutter/material.dart';
import '../models/packer_summary_one_container_model.dart';

/// A provider class for the PackerSummaryOneContainerScreen.
///
/// This provider manages the state of the PackerSummaryOneContainerScreen, including the
/// current packerSummaryOneContainerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PackerSummaryOneContainerProvider extends ChangeNotifier {
  PackerSummaryOneContainerModel packerSummaryOneContainerModelObj =
      PackerSummaryOneContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
