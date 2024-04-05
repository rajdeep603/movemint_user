import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_details_date_time_model.dart';
import '../models/frame_item_model.dart';
import '../models/frame2_item_model.dart';

/// A provider class for the PackerDetailsDateTimeScreen.
///
/// This provider manages the state of the PackerDetailsDateTimeScreen, including the
/// current packerDetailsDateTimeModelObj

// ignore_for_file: must_be_immutable
class PackerDetailsDateTimeProvider extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();

  PackerDetailsDateTimeModel packerDetailsDateTimeModelObj =
      PackerDetailsDateTimeModel();

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    packerDetailsDateTimeModelObj.frameItemList.forEach((element) {
      element.isSelected = false;
    });
    packerDetailsDateTimeModelObj.frameItemList[index].isSelected = value;
    notifyListeners();
  }

  void onSelectedChipView2(
    int index,
    bool value,
  ) {
    packerDetailsDateTimeModelObj.frame2ItemList.forEach((element) {
      element.isSelected = false;
    });
    packerDetailsDateTimeModelObj.frame2ItemList[index].isSelected = value;
    notifyListeners();
  }
}
