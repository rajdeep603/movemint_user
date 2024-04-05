import 'frame_item_model.dart';
import 'frame2_item_model.dart';
import '../../../core/app_export.dart';

class PackerDetailsDateTimeModel {
  List<FrameItemModel> frameItemList =
      List.generate(6, (index) => FrameItemModel());

  List<Frame2ItemModel> frame2ItemList =
      List.generate(3, (index) => Frame2ItemModel());
}
