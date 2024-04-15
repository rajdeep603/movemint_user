import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../order_details_screen/packer_summary_one_page.dart';
import 'models/packer_summary_one_one_model.dart';
import 'provider/packer_summary_one_one_provider.dart';

class PackerSummaryOneOneScreen extends StatefulWidget {
  const PackerSummaryOneOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PackerSummaryOneOneScreenState createState() =>
      PackerSummaryOneOneScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerSummaryOneOneProvider(),
      child: PackerSummaryOneOneScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PackerSummaryOneOneScreenState extends State<PackerSummaryOneOneScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 711.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildStack(context),
                  _buildColumncheckmark(context)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottombar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
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
        text: "lbl_tracking".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 220.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 600.v,
              width: 430.h,
              child: Image.network(
                  "https://1.bp.blogspot.com/-T-EiGEHM1rE/XXheM0zqA2I/AAAAAAAACKo/uNn0t2VesUYE6QtOxXm4qoaiJLKWhu21QCLcBGAsYHQ/s1600/Screen%2BShot%2B2019-09-11%2Bat%2B12.37.26%2BPM.png"),
            ),
            // CustomImageView(
            //   imagePath: ImageConstant.imgWhatsappImage20240227434x430,
            //   height: 434.v,
            //   width: 430.h,
            //   alignment: Alignment.center,
            // ),
            // CustomImageView(
            //   imagePath: ImageConstant.imgGroup1171281262,
            //   height: 178.v,
            //   width: 196.h,
            //   alignment: Alignment.topRight,
            //   margin: EdgeInsets.only(
            //     top: 41.v,
            //     right: 99.h,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumncheckmark(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.h,
          vertical: 20.v,
        ),
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.v),
            Padding(
              padding: EdgeInsets.only(
                left: 17.h,
                right: 90.h,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCheckmark,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    margin: EdgeInsets.only(bottom: 2.v),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "msg_booking_confirmed".tr,
                            style: CustomTextStyles.labelLargeTeal600_1,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            "msg_lorem_ipsum_dolor".tr,
                            style: theme.textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 6.v),
            CustomImageView(
              imagePath: ImageConstant.imgLightBulb,
              height: 27.v,
              width: 32.h,
              margin: EdgeInsets.only(left: 17.h),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(
                left: 17.h,
                right: 90.h,
              ),
              child: _buildRowcheckmark(
                context,
                itempickup: "msg_partner_assigned".tr,
                loremipsumTwo: "msg_lorem_ipsum_dolor".tr,
              ),
            ),
            SizedBox(height: 6.v),
            CustomImageView(
              imagePath: ImageConstant.imgLightBulb,
              height: 27.v,
              width: 32.h,
              margin: EdgeInsets.only(left: 17.h),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(
                left: 17.h,
                right: 90.h,
              ),
              child: _buildRowcheckmark(
                context,
                itempickup: "lbl_item_pick_up".tr,
                loremipsumTwo: "msg_lorem_ipsum_dolor".tr,
              ),
            ),
            SizedBox(height: 6.v),
            CustomImageView(
              imagePath: ImageConstant.imgLightBulbBlueGray200,
              height: 27.v,
              width: 32.h,
              margin: EdgeInsets.only(left: 17.h),
            ),
            SizedBox(height: 8.v),
            Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgStepSymbol,
                          height: 32.adaptSize,
                          width: 32.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "msg_unloading_package".tr,
                                style: CustomTextStyles.labelLargeTeal600_1,
                              ),
                              SizedBox(height: 3.v),
                              Text(
                                "msg_share_the_otp_while".tr,
                                style: theme.textTheme.bodySmall,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    height: 35.v,
                    width: 94.h,
                    text: "lbl_otp_4258".tr,
                    buttonStyle: CustomButtonStyles.fillPurple,
                    buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                  )
                ],
              ),
            ),
            SizedBox(height: 29.v),
            Container(
              margin: EdgeInsets.only(left: 2.h),
              padding: EdgeInsets.only(
                top: 9.v,
                bottom: 10.v,
              ),
              decoration: AppDecoration.outlineGray500,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.v),
                    child: CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      decoration: IconButtonStyleHelper.fillDeepPurple,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgLock,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 13.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_vignesh".tr,
                          style: CustomTextStyles.titleSmallGray900,
                        ),
                        SizedBox(height: 3.v),
                        Text(
                          "msg_delivery_partner".tr,
                          style: CustomTextStyles.bodySmallGray600,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomOutlinedButton(
                    width: 120.h,
                    text: "lbl_call".tr,
                    margin: EdgeInsets.only(top: 10.v),
                    leftIcon: Container(
                        margin: EdgeInsets.only(right: 8.h),
                        child: Icon(
                          Icons.call_outlined,
                          color: Colors.green,
                          size: 20,
                        )),
                    buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottombar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildRowcheckmark(
    BuildContext context, {
    required String itempickup,
    required String loremipsumTwo,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgCheckmark,
          height: 32.adaptSize,
          width: 32.adaptSize,
          margin: EdgeInsets.only(bottom: 2.v),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itempickup,
                  style: CustomTextStyles.labelLargeTeal600_1.copyWith(
                    color: appTheme.teal600,
                  ),
                ),
                SizedBox(height: 3.v),
                Text(
                  loremipsumTwo,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: appTheme.gray500,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.packerSummaryOnePage;
      case BottomBarEnum.Orders:
        return "/";
      case BottomBarEnum.Payment:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.packerSummaryOnePage:
        return PackerSummaryOnePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
