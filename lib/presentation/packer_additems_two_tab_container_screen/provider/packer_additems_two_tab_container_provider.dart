import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_additems_two_tab_container_model.dart';

/// A provider class for the PackerAdditemsTwoTabContainerScreen.
///
/// This provider manages the state of the PackerAdditemsTwoTabContainerScreen, including the
/// current packerAdditemsTwoTabContainerModelObj
class PackerAdditemsTwoTabContainerProvider extends ChangeNotifier {
  PackerAdditemsTwoTabContainerModel packerAdditemsTwoTabContainerModelObj =
      PackerAdditemsTwoTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
