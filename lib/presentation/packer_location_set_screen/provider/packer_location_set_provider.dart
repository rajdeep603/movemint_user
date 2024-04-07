import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../domain/providers/create_order_provider.dart';
import '../../packer_details_between_cities_page/models/packer_details_between_cities_model.dart';
import '../../packer_details_within_city_page/models/packer_details_within_city_model.dart';
import '../models/packer_details_within_city_tab_container_model.dart';

class PackerLocationSetProvider extends ChangeNotifier {
  PackerLocationSetProvider(this.screenContext);

  BuildContext screenContext;

  // TextEditingController pickUpLocationController = TextEditingController();
  // TextEditingController dropLocationController = TextEditingController();

  PackerDetailsWithinCityModel packerDetailsWithinCityModelObj =
      PackerDetailsWithinCityModel();

  // TextEditingController searchCityController = TextEditingController();

  PackerDetailsBetweenCitiesModel packerDetailsBetweenCitiesModelObj =
      PackerDetailsBetweenCitiesModel();

  bool checkbox = false;

  onSelected(dynamic value) {
    for (var element in packerDetailsWithinCityModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  void onDropDownChange(BuildContext context, String val) {
    context.read<CreateOrderProvider>().searchCityController.text = val;
    // context.read<CreateOrderProvider>().notifyListeners();
    notifyListeners();
  }

  void changeCheckBox1(bool value) {
    checkbox = value;
    notifyListeners();
  }
}
