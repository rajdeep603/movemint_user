import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/packer_summary_one_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'provider/packer_summary_one_provider.dart';

class PackerSummaryOneScreen extends StatefulWidget {
  const PackerSummaryOneScreen({Key? key}) : super(key: key);

  @override
  PackerSummaryOneScreenState createState() => PackerSummaryOneScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PackerSummaryOneProvider(),
        child: PackerSummaryOneScreen());
  }
}

class PackerSummaryOneScreenState extends State<PackerSummaryOneScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed(
    //     AppRoutes.packerSummaryTwoScreen,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 38.v),
                    child: SizedBox(
                        height: 60.v,
                        width: 350.h,
                        child: Stack(alignment: Alignment.center, children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            height: 52.v,
                                            width: 295.h,
                                            child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  AnotherStepper(
                                                      iconHeight: 50,
                                                      iconWidth: 41,
                                                      stepperDirection:
                                                          Axis.horizontal,
                                                      activeIndex: 0,
                                                      barThickness: 1,
                                                      inverted: true,
                                                      stepperList: [
                                                        StepperData(
                                                            iconWidget: Column(
                                                                children: [
                                                              SizedBox(
                                                                  height: 24
                                                                      .adaptSize,
                                                                  width: 24
                                                                      .adaptSize,
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter,
                                                                      children: [
                                                                        CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgPlay,
                                                                            height: 24.adaptSize,
                                                                            width: 24.adaptSize,
                                                                            alignment: Alignment.center),
                                                                        CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgCheckmark,
                                                                            height: 7.v,
                                                                            alignment: Alignment.bottomCenter,
                                                                            margin: EdgeInsets.only(bottom: 7.v))
                                                                      ])),
                                                              Text(
                                                                  "lbl_details"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelLarge)
                                                            ])),
                                                        StepperData(
                                                            iconWidget: Column(
                                                                children: [
                                                              Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgPlay,
                                                                        height: 24
                                                                            .adaptSize,
                                                                        width: 24
                                                                            .adaptSize,
                                                                        alignment:
                                                                            Alignment.center),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgCheckmark,
                                                                        height:
                                                                            7.v,
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                7.v))
                                                                  ]),
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 11
                                                                              .v),
                                                                  child: Text(
                                                                      "lbl_details"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge))
                                                            ])),
                                                        StepperData(
                                                            iconWidget: Column(
                                                                children: [
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgPlay,
                                                                  height: 24
                                                                      .adaptSize,
                                                                  width: 24
                                                                      .adaptSize),
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 13
                                                                              .v),
                                                                  child: Text(
                                                                      "lbl_summary"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge))
                                                            ]))
                                                      ]),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                          height: 52.v,
                                                          width: 57.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.h))))
                                                ])),
                                        SizedBox(height: 26.v),
                                        _buildMovingDetails(context),
                                        SizedBox(height: 20.v),
                                        _buildItem(context),
                                        SizedBox(height: 20.v),
                                        _buildOffer(context),
                                        SizedBox(height: 20.v),
                                        _buildStepperHorizontal(context)
                                      ]))),
                          _buildFrame(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgLeftButton,
            margin: EdgeInsets.only(left: 24.h, top: 37.v, bottom: 29.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_summary".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildMovingDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.fillGray5002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text("lbl_moving_details".tr,
                    style: CustomTextStyles.titleSmallGray90001)),
            Text("lbl_edit".tr, style: theme.textTheme.titleSmall)
          ]),
          SizedBox(height: 8.v),
          Container(
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 11.h, top: 20.v, bottom: 20.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 7.v),
                                        child: Column(children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgIconsLocation,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize),
                                          SizedBox(height: 8.v),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.h),
                                                  child: SizedBox(
                                                      height: 51.v,
                                                      child: VerticalDivider(
                                                          width: 1.h,
                                                          thickness: 1.v))))
                                        ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.h, bottom: 41.v),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_from".tr,
                                                  style: CustomTextStyles
                                                      .labelLargeSemiBold),
                                              SizedBox(height: 2.v),
                                              Text("msg_9th_main_nehru".tr,
                                                  style: CustomTextStyles
                                                      .labelLargeSemiBold),
                                              SizedBox(height: 1.v),
                                              Row(children: [
                                                Text("lbl_sender".tr,
                                                    style: theme
                                                        .textTheme.bodySmall),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.h),
                                                    child: Text(
                                                        "lbl_vaishak".tr,
                                                        style: CustomTextStyles
                                                            .labelLargeMedium))
                                              ])
                                            ]))
                                  ]),
                              SizedBox(height: 3.v),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgIconsLocation,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                        margin: EdgeInsets.only(
                                            top: 4.v, bottom: 20.v)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5.h),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_delivery_to".tr,
                                                  style: CustomTextStyles
                                                      .labelLargeSemiBold),
                                              SizedBox(height: 2.v),
                                              Text("msg_bagmane_tech_park".tr,
                                                  style: CustomTextStyles
                                                      .labelLargeSemiBold),
                                              Row(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 1.v),
                                                    child: Text(
                                                        "lbl_receiver".tr,
                                                        style: theme.textTheme
                                                            .bodySmall)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.h),
                                                    child: Text("lbl_roy".tr,
                                                        style: CustomTextStyles
                                                            .labelLargeMedium))
                                              ])
                                            ]))
                                  ])
                            ])),
                    SizedBox(
                        height: 184.v,
                        width: 177.h,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgRectangle3,
                              width: 177.h,
                              radius: BorderRadius.horizontal(
                                  right: Radius.circular(10.h)),
                              alignment: Alignment.center),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 19.h, top: 17.v, right: 15.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.h, vertical: 7.v),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              fs.Svg(ImageConstant.imgGroup21),
                                          fit: BoxFit.cover)),
                                  child: Container(
                                      height: 7.adaptSize,
                                      width: 7.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.gray90002,
                                          borderRadius:
                                              BorderRadius.circular(3.h)))))
                        ]))
                  ])),
          SizedBox(height: 20.v),
          Container(
              decoration: AppDecoration.fillWhiteA
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
                  decoration: AppDecoration.outlineGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 2.v),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_feb_24_2024".tr,
                                      style: theme.textTheme.bodyMedium),
                                  TextSpan(
                                      text: "lbl_i_2pm".tr,
                                      style:
                                          CustomTextStyles.bodyMediumff01a367)
                                ]),
                                textAlign: TextAlign.left)),
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text("lbl_edit".tr,
                                style: theme.textTheme.titleSmall))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildItem(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: appTheme.gray50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Container(
            height: 100.v,
            width: 390.h,
            decoration: AppDecoration.fillGray50
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Stack(alignment: Alignment.centerRight, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: 100.v,
                      width: 95.h,
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                height: 100.v,
                                width: 90.h,
                                decoration: BoxDecoration(
                                    color: appTheme.blue50,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10.h))))),
                        CustomImageView(
                            imagePath: ImageConstant.imgImage193,
                            width: 95.h,
                            alignment: Alignment.center)
                      ]))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: EdgeInsets.only(left: 90.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 17.v),
                      decoration: AppDecoration.fillGray5002,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("lbl_inventory_cart".tr,
                                style:
                                    CustomTextStyles.titleSmallGray90001Bold),
                            SizedBox(height: 7.v),
                            Text("lbl_view_items_2".tr,
                                style: CustomTextStyles.labelLargeGreenA70001
                                    .copyWith(
                                        decoration: TextDecoration.underline)),
                            SizedBox(height: 7.v),
                            Text("lbl_2500_00".tr,
                                style: theme.textTheme.labelLarge)
                          ])))
            ])));
  }

  /// Section Widget
  Widget _buildOffer(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        decoration: AppDecoration.fillGray5003
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomImageView(
              imagePath: ImageConstant.imgMdiCoupon,
              height: 32.adaptSize,
              width: 32.adaptSize),
          Padding(
              padding: EdgeInsets.only(top: 9.v, bottom: 7.v),
              child: Selector<PackerSummaryOneProvider, TextEditingController?>(
                  selector: (context, provider) => provider.subtitleController,
                  builder: (context, subtitleController, child) {
                    return CustomTextFormField(
                        width: 262.h,
                        controller: subtitleController,
                        hintText: "msg_enter_referral_or".tr,
                        textInputAction: TextInputAction.done);
                  })),
          Padding(
              padding: EdgeInsets.only(top: 9.v, bottom: 7.v),
              child: Text("lbl_apply".tr,
                  style: CustomTextStyles.labelLargeTeal600))
        ]));
  }

  /// Section Widget
  Widget _buildStepperHorizontal(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: appTheme.purple900,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Container(
            height: 123.v,
            width: 390.h,
            padding: EdgeInsets.symmetric(horizontal: 72.h, vertical: 24.v),
            decoration: AppDecoration.fillPurple
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Stack(alignment: Alignment.bottomRight, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 9.h, right: 141.h),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgCheckmarkWhiteA700,
                            height: 32.adaptSize,
                            width: 32.adaptSize),
                        SizedBox(height: 10.v),
                        SizedBox(
                            width: 94.h,
                            child: Text("msg_booking_amount".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodySmallWhiteA700))
                      ]))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text("msg_at_time_of_unloading".tr,
                      style: CustomTextStyles.bodySmallWhiteA700)),
              Padding(
                  padding: EdgeInsets.only(right: 40.h),
                  child: Slider(
                      value: 0.0, min: 0.0, max: 100.0, onChanged: (value) {}))
            ])));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 655.v, bottom: 32.v),
            padding: EdgeInsets.symmetric(horizontal: 22.h),
            decoration: AppDecoration.outlineGray300,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 26.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_booking_amount".tr,
                                style: CustomTextStyles
                                    .titleMediumGray600SemiBold),
                            SizedBox(height: 8.v),
                            Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(text: " "),
                                      TextSpan(
                                          text: "lbl".tr,
                                          style: CustomTextStyles
                                              .titleMediumff47286f),
                                      TextSpan(
                                          text: "lbl_5002".tr,
                                          style: CustomTextStyles
                                              .titleMediumff47286fSemiBold)
                                    ]),
                                    textAlign: TextAlign.left))
                          ])),
                  CustomElevatedButton(
                      width: 181.h,
                      text: "lbl_confirm".tr,
                      margin: EdgeInsets.only(top: 25.v))
                ])));
  }

  /// Common widget
  Widget _buildThirtySix(
    BuildContext context, {
    required String title,
  }) {
    return Column(children: [
      SizedBox(
          height: 24.adaptSize,
          width: 24.adaptSize,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            CustomImageView(
                imagePath: ImageConstant.imgPlay,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.center),
            CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 7.v,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 7.v))
          ])),
      SizedBox(height: 11.v),
      Text(title,
          style:
              theme.textTheme.labelLarge!.copyWith(color: appTheme.gray90001))
    ]);
  }
}
