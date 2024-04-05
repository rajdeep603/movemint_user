import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_details_within_city_model.dart';

/// A provider class for the PackerDetailsWithinCityPage.
///
/// This provider manages the state of the PackerDetailsWithinCityPage, including the
/// current packerDetailsWithinCityModelObj
class PackerDetailsWithinCityProvider extends ChangeNotifier {
  TextEditingController trackFieldController = TextEditingController();

  PackerDetailsWithinCityModel packerDetailsWithinCityModelObj =
      PackerDetailsWithinCityModel();

  @override
  void dispose() {
    super.dispose();
    trackFieldController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in packerDetailsWithinCityModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
