import '../../../core/app_export.dart';

/// This class is used in the [frame_item_widget] screen.
class FrameItemModel {
  FrameItemModel({
    this.tag,
    this.isSelected,
  }) {
    tag = tag ?? "Today,23";
    isSelected = isSelected ?? false;
  }

  String? tag;

  bool? isSelected;
}
