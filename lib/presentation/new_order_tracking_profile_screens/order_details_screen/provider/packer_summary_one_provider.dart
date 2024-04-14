import 'package:flutter/material.dart';
import '../models/packer_summary_one_model.dart';

class PackerSummaryOneProvider extends ChangeNotifier {
  TextEditingController timeController = TextEditingController();

  // PackerSummaryOneModel packerSummaryOneModelObj = PackerSummaryOneModel();

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
  }

  // onSelected(dynamic value) {
  //   for (var element in packerSummaryOneModelObj.dropdownItemList) {
  //     element.isSelected = false;
  //     if (element.id == value.id) {
  //       element.isSelected = true;
  //     }
  //   }
  //   notifyListeners();
  // }
  //
  // onSelected1(dynamic value) {
  //   for (var element in packerSummaryOneModelObj.dropdownItemList1) {
  //     element.isSelected = false;
  //     if (element.id == value.id) {
  //       element.isSelected = true;
  //     }
  //   }
  //   notifyListeners();
  // }
}
