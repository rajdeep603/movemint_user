import '../../../core/app_export.dart';

/// This class is used in the [frame2_item_widget] screen.
class Frame2ItemModel {
  Frame2ItemModel({
    this.tag,
    this.isSelected,
  }) {
    tag = tag ?? "9AM";
    isSelected = isSelected ?? false;
  }

  String? tag;

  bool? isSelected;
}
