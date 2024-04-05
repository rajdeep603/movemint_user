import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_details_within_city_tab_container_model.dart';

/// A provider class for the PackerDetailsWithinCityTabContainerScreen.
///
/// This provider manages the state of the PackerDetailsWithinCityTabContainerScreen, including the
/// current packerDetailsWithinCityTabContainerModelObj
class PackerDetailsWithinCityTabContainerProvider extends ChangeNotifier {
  PackerDetailsWithinCityTabContainerModel
      packerDetailsWithinCityTabContainerModelObj =
      PackerDetailsWithinCityTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
