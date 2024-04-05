import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_details_between_cities_model.dart';

/// A provider class for the PackerDetailsBetweenCitiesPage.
///
/// This provider manages the state of the PackerDetailsBetweenCitiesPage, including the
/// current packerDetailsBetweenCitiesModelObj
class PackerDetailsBetweenCitiesProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  PackerDetailsBetweenCitiesModel packerDetailsBetweenCitiesModelObj =
      PackerDetailsBetweenCitiesModel();

  bool checkbox = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void changeCheckBox1(bool value) {
    checkbox = value;
    notifyListeners();
  }
}
