// import '../../../core/app_export.dart';
// import '../../../data/models/selectionPopupModel/selection_popup_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
import '../../../../domain/models/selectionPopupModel/selection_popup_model.dart';

class PackerSummaryOneModel {
  List<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];

  List<SelectionPopupModel> dropdownItemList1 = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];
}
