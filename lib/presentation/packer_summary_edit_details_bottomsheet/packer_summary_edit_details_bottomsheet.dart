import '../../core/app_export.dart';
import 'models/packer_summary_edit_details_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'provider/packer_summary_edit_details_provider.dart';

// ignore_for_file: must_be_immutable
class PackerSummaryEditDetailsBottomsheet extends StatefulWidget {
  const PackerSummaryEditDetailsBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  PackerSummaryEditDetailsBottomsheetState createState() =>
      PackerSummaryEditDetailsBottomsheetState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerSummaryEditDetailsProvider(),
      child: PackerSummaryEditDetailsBottomsheet(),
    );
  }
}

class PackerSummaryEditDetailsBottomsheetState
    extends State<PackerSummaryEditDetailsBottomsheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildMovingDetails(context),
    );
  }

  /// Section Widget
  Widget _buildMovingDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 377.v,
      ),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.fillGray5002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "lbl_moving_details".tr,
                    style: CustomTextStyles.titleSmallGray90001,
                  ),
                ),
                Text(
                  "lbl_edit".tr,
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Container(
            decoration: AppDecoration.white.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 11.h,
                    top: 20.v,
                    bottom: 20.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgIconsLocation,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            margin: EdgeInsets.only(top: 7.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_from".tr,
                                  style: CustomTextStyles.labelLargeSemiBold,
                                ),
                                SizedBox(height: 2.v),
                                Text(
                                  "msg_9th_main_nehru".tr,
                                  style: CustomTextStyles.labelLargeSemiBold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.v),
                      Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 56.v,
                              child: VerticalDivider(
                                width: 1.h,
                                thickness: 1.v,
                                indent: 5.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.h,
                                bottom: 41.v,
                              ),
                              child: Text(
                                "lbl_sender".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 4.h,
                                bottom: 41.v,
                              ),
                              child: Text(
                                "lbl_vaishak".tr,
                                style: CustomTextStyles.labelLargeMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgIconsLocation,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            margin: EdgeInsets.only(
                              top: 4.v,
                              bottom: 20.v,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_delivery_to".tr,
                                  style: CustomTextStyles.labelLargeSemiBold,
                                ),
                                SizedBox(height: 2.v),
                                Text(
                                  "msg_bagmane_tech_park".tr,
                                  style: CustomTextStyles.labelLargeSemiBold,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.v),
                                      child: Text(
                                        "lbl_receiver".tr,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.h),
                                      child: Text(
                                        "lbl_roy".tr,
                                        style:
                                            CustomTextStyles.labelLargeMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 184.v,
                  width: 177.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle3,
                        width: 177.h,
                        radius: BorderRadius.horizontal(
                          right: Radius.circular(10.h),
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 19.h,
                            top: 17.v,
                            right: 15.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.h,
                            vertical: 7.v,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: fs.Svg(
                                ImageConstant.imgGroup21,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            height: 7.adaptSize,
                            width: 7.adaptSize,
                            decoration: BoxDecoration(
                              color: appTheme.gray90002,
                              borderRadius: BorderRadius.circular(
                                3.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.v),
          Container(
            decoration: AppDecoration.fillWhiteA,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.h,
                vertical: 13.v,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_feb_24_2024".tr,
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: "lbl_i_2pm".tr,
                            style: CustomTextStyles.bodyMediumff01a367,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Text(
                      "lbl_edit".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
