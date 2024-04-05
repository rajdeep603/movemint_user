import '../../core/app_export.dart';
import 'models/packer_summary_edit_items_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_summary_edit_items_provider.dart';

// ignore_for_file: must_be_immutable
class PackerSummaryEditItemsBottomsheet extends StatefulWidget {
  const PackerSummaryEditItemsBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  PackerSummaryEditItemsBottomsheetState createState() =>
      PackerSummaryEditItemsBottomsheetState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerSummaryEditItemsProvider(),
      child: PackerSummaryEditItemsBottomsheet(),
    );
  }
}

class PackerSummaryEditItemsBottomsheetState
    extends State<PackerSummaryEditItemsBottomsheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScrollView(context);
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.only(
          left: 20.h,
          right: 20.h,
          bottom: 257.v,
        ),
        color: appTheme.gray50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Container(
          height: 100.v,
          width: 390.h,
          decoration: AppDecoration.fillGray50.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 100.v,
                  width: 95.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 100.v,
                          width: 90.h,
                          decoration: BoxDecoration(
                            color: appTheme.blue50,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10.h),
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgImage193,
                        width: 95.h,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(left: 90.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 17.v,
                  ),
                  decoration: AppDecoration.fillGray5002,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "lbl_inventory_cart".tr,
                        style: CustomTextStyles.titleSmallGray90001Bold,
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "lbl_view_items_2".tr,
                        style: CustomTextStyles.labelLargeGreenA70001.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "lbl_2500_00".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
