import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/packer_summary_two_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_summary_two_provider.dart';

class PackerSummaryTwoScreen extends StatefulWidget {
  const PackerSummaryTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PackerSummaryTwoScreenState createState() => PackerSummaryTwoScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerSummaryTwoProvider(),
      child: PackerSummaryTwoScreen(),
    );
  }
}

class PackerSummaryTwoScreenState extends State<PackerSummaryTwoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // SizedBox(height: 38.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // margin: EdgeInsets.only(bottom: 5.v),
                    // padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.red,
                          height: 220.v,
                          width: 400.h,
                          margin: EdgeInsets.only(left: 41.h),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              AnotherStepper(
                                iconHeight: 50,
                                iconWidth: 41,
                                stepperDirection: Axis.horizontal,
                                activeIndex: 0,
                                barThickness: 1,
                                inverted: true,
                                stepperList: [
                                  StepperData(
                                    iconWidget: Column(
                                      children: [
                                        SizedBox(
                                          height: 40.adaptSize,
                                          width: 24.adaptSize,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgPlay,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize,
                                                alignment: Alignment.center,
                                              ),
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgCheckmark,
                                                height: 7.v,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "lbl_details".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  StepperData(
                                    iconWidget: Column(
                                      children: [
                                        SizedBox(
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgPlay,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize,
                                                alignment: Alignment.center,
                                              ),
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgCheckmark,
                                                height: 7.v,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                margin: EdgeInsets.only(
                                                    bottom: 7.v),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "lbl_add_items".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  StepperData(
                                    iconWidget: Column(
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgPlay,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                        ),
                                        Text(
                                          "lbl_summary".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Align(
                              //   alignment: Alignment.centerRight,
                              //   child: Container(
                              //     height: 52.v,
                              //     width: 57.h,
                              //     decoration: BoxDecoration(
                              //       color: Colors.blue,
                              //       borderRadius: BorderRadius.circular(
                              //         8.h,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 26.v),
                        _buildItem(context),
                        SizedBox(height: 20.v),
                        _buildOffer(context),
                        SizedBox(height: 20.v),
                        _buildText(context),
                        SizedBox(height: 19.v),
                        _buildTwo(context),
                        SizedBox(height: 17.v),
                        _buildThree(context),
                        SizedBox(height: 18.v),
                        _buildToast(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildActionBottom2(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLeftButton,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 37.v,
          bottom: 29.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_summary".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildItem(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_inventory_cart".tr,
                            style: CustomTextStyles.titleSmallGray90001Bold,
                          ),
                          SizedBox(height: 6.v),
                          Text(
                            "lbl_view_items_2".tr,
                            style: CustomTextStyles.labelLargeGreenA70001,
                          ),
                          SizedBox(height: 9.v),
                          Text(
                            "lbl_2500_00".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 46.v),
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
      ),
    );
  }

  /// Section Widget
  Widget _buildOffer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.v),
      decoration: AppDecoration.fillGray5003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMdiCoupon,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 9.v,
              bottom: 7.v,
            ),
            child: Selector<PackerSummaryTwoProvider, TextEditingController?>(
              selector: (
                context,
                provider,
              ) =>
                  provider.subtitleController,
              builder: (context, subtitleController, child) {
                return CustomTextFormField(
                  width: 262.h,
                  controller: subtitleController,
                  hintText: "msg_enter_referral_or".tr,
                  textInputAction: TextInputAction.done,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 9.v,
              bottom: 7.v,
            ),
            child: Text(
              "lbl_apply".tr,
              style: CustomTextStyles.labelLargeTeal600,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildText(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.purple900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Container(
        height: 123.v,
        width: 390.h,
        padding: EdgeInsets.symmetric(
          horizontal: 72.h,
          vertical: 24.v,
        ),
        decoration: AppDecoration.fillPurple.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 9.h,
                  right: 141.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgStepSymbol,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                    ),
                    SizedBox(height: 10.v),
                    SizedBox(
                      width: 94.h,
                      child: Text(
                        "msg_booking_amount".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodySmallWhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 15.v),
                child: SizedBox(
                  width: 80.h,
                  child: Divider(
                    color: appTheme.whiteA700,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 131.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgStepSymbolWhiteA700,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "msg_at_time_of_unloading".tr,
                      style: CustomTextStyles.bodySmallWhiteA700,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "msg_total_amounts_to".tr,
              style: CustomTextStyles.titleSmallGray600,
            ),
          ),
          Text(
            "lbl_2500".tr,
            style: CustomTextStyles.titleSmallGray600,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThree(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_booking_amout".tr,
                  style: CustomTextStyles.titleSmallBlack900Medium,
                ),
                SizedBox(height: 4.v),
                SizedBox(
                  width: 191.h,
                  child: Text(
                    "msg_booking_amount_of".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallGray600.copyWith(
                      height: 1.33,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 39.v),
            child: Text(
              "lbl_5003".tr,
              style: CustomTextStyles.titleSmallBlack900,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildToast(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.fillGray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLeftIcon,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 22.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 2.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_booking_amount".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 2.v),
                  SizedBox(
                    width: 267.h,
                    child: Text(
                      "msg_pay_booking_amount".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallGray800.copyWith(
                        height: 1.33,
                      ),
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

  /// Section Widget
  Widget _buildActionBottom2(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 22.h,
        right: 22.h,
        bottom: 32.v,
      ),
      decoration: AppDecoration.fillWhiteA,
      child: Container(
        decoration: AppDecoration.outlineGray300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_booking_amount".tr,
                    style: CustomTextStyles.titleMediumGray600SemiBold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 8.v,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "lbl".tr,
                            style: CustomTextStyles.titleMediumff47286f,
                          ),
                          TextSpan(
                            text: "lbl_5002".tr,
                            style: CustomTextStyles.titleMediumff47286fSemiBold,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              width: 181.h,
              text: "lbl_confirm".tr,
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildSeventyTwo(BuildContext context) {
    return SizedBox(
      height: 24.adaptSize,
      width: 24.adaptSize,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPlay,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgCheckmark,
            height: 7.v,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 7.v),
          ),
        ],
      ),
    );
  }
}
