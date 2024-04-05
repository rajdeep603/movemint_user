import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_additems_two_model.dart';

/// A provider class for the PackerAdditemsTwoPage.
///
/// This provider manages the state of the PackerAdditemsTwoPage, including the
/// current packerAdditemsTwoModelObj
class PackerAdditemsTwoProvider extends ChangeNotifier {
  PackerAdditemsTwoModel packerAdditemsTwoModelObj = PackerAdditemsTwoModel();

  bool viewAll = false;

  @override
  void dispose() {
    super.dispose();
  }

  void changeCheckBox1(bool value) {
    viewAll = value;
    notifyListeners();
  }
}
