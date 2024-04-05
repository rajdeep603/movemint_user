import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_additems_one_model.dart';

/// A provider class for the PackerAdditemsOnePage.
///
/// This provider manages the state of the PackerAdditemsOnePage, including the
/// current packerAdditemsOneModelObj
class PackerAdditemsOneProvider extends ChangeNotifier {
  PackerAdditemsOneModel packerAdditemsOneModelObj = PackerAdditemsOneModel();

  @override
  void dispose() {
    super.dispose();
  }
}
