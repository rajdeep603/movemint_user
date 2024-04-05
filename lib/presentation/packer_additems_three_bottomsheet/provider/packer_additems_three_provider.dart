import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_additems_three_model.dart';

/// A provider class for the PackerAdditemsThreeBottomsheet.
///
/// This provider manages the state of the PackerAdditemsThreeBottomsheet, including the
/// current packerAdditemsThreeModelObj
class PackerAdditemsThreeProvider extends ChangeNotifier {
  PackerAdditemsThreeModel packerAdditemsThreeModelObj =
      PackerAdditemsThreeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
