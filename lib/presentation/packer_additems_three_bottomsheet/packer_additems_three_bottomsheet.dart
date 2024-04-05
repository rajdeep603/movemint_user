import '../../core/app_export.dart';
import 'models/packer_additems_three_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_additems_three_provider.dart';

// ignore_for_file: must_be_immutable
class PackerAdditemsThreeBottomsheet extends StatefulWidget {
  const PackerAdditemsThreeBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  PackerAdditemsThreeBottomsheetState createState() =>
      PackerAdditemsThreeBottomsheetState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerAdditemsThreeProvider(),
      child: PackerAdditemsThreeBottomsheet(),
    );
  }
}

class PackerAdditemsThreeBottomsheetState
    extends State<PackerAdditemsThreeBottomsheet> {
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
      child: Container(
        margin: EdgeInsets.only(bottom: 60.v),
        padding: EdgeInsets.symmetric(
          horizontal: 21.h,
          vertical: 20.v,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "lbl_added_items".tr,
                        style:
                            CustomTextStyles.titleMediumSFProDisplayOnPrimary,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRight,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(left: 117.h),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.v),
            Container(
              padding: EdgeInsets.all(12.h),
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12.h, 11.v, 12.h, 10.v),
                    decoration: AppDecoration.outlineDeepPurple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_chair".tr,
                          style: CustomTextStyles.titleSmallMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.h),
                          child: Text(
                            "lbl_1".tr,
                            style: CustomTextStyles.titleSmallMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_tables".tr,
                          style: CustomTextStyles.titleSmallMedium,
                        ),
                        Text(
                          "lbl_1".tr,
                          style: CustomTextStyles.titleSmallMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 11.v),
                ],
              ),
            ),
            SizedBox(height: 55.v),
          ],
        ),
      ),
    );
  }
}
