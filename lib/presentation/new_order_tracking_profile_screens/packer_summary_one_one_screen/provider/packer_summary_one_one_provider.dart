import 'package:flutter/material.dart';
import '../models/packer_summary_one_one_model.dart';

/// A provider class for the PackerSummaryOneOneScreen.
///
/// This provider manages the state of the PackerSummaryOneOneScreen, including the
/// current packerSummaryOneOneModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PackerSummaryOneOneProvider extends ChangeNotifier {
  PackerSummaryOneOneModel packerSummaryOneOneModelObj =
      PackerSummaryOneOneModel();

  @override
  void dispose() {
    super.dispose();
  }
}
