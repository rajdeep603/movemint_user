import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../packer_details_between_cities_page/packer_details_between_cities_page.dart';
import '../packer_details_within_city_page/packer_details_within_city_page.dart';
import 'models/packer_details_within_city_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_details_within_city_tab_container_provider.dart';

class PackerDetailsWithinCityTabContainerScreen extends StatefulWidget {
  const PackerDetailsWithinCityTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PackerDetailsWithinCityTabContainerScreenState createState() =>
      PackerDetailsWithinCityTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerDetailsWithinCityTabContainerProvider(),
      child: PackerDetailsWithinCityTabContainerScreen(),
    );
  }
}

class PackerDetailsWithinCityTabContainerScreenState
    extends State<PackerDetailsWithinCityTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 38.v),
            child: SizedBox(
              // color: Colors.red,
              height: 800.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildFrame(context),
                  Container(
                    margin: EdgeInsets.only(top: 127.v),
                    // color: Colors.deepOrangeAccent,
                    height: 638.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        PackerDetailsWithinCityPage.builder(context),
                        PackerDetailsBetweenCitiesPage.builder(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
        text: "lbl_details".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 85.v,
              width: 350.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(right: 254.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgClock,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          SizedBox(height: 11.v),
                          Text(
                            "lbl_details".tr,
                            style: CustomTextStyles.labelLargePrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 113.h,
                        right: 121.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgContrastGray300,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          SizedBox(height: 12.v),
                          Text(
                            "lbl_add_items".tr,
                            style: CustomTextStyles.labelLargeGray300,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(left: 238.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgContrastGray300,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          SizedBox(height: 13.v),
                          Text(
                            "lbl_summary".tr,
                            style: CustomTextStyles.labelLargeGray300,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.v),
                      child: SizedBox(
                        width: 126.h,
                        child: Divider(
                          color: appTheme.greenA700,
                          indent: 38.h,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.v),
                      child: SizedBox(
                        width: 131.h,
                        child: Divider(
                          color: appTheme.gray500,
                          endIndent: 43.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.v),
            Container(
              height: 48.v,
              width: 390.h,
              decoration: BoxDecoration(
                color: appTheme.gray10001,
                borderRadius: BorderRadius.circular(
                  16.h,
                ),
              ),
              child: TabBar(
                controller: tabviewController,
                labelPadding: EdgeInsets.zero,
                labelColor: appTheme.gray50,
                labelStyle: TextStyle(
                  fontSize: 12.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: appTheme.gray600,
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                indicatorPadding: EdgeInsets.all(
                  4.0.h,
                ),
                indicator: BoxDecoration(
                  color: appTheme.purple900,
                  borderRadius: BorderRadius.circular(
                    12.h,
                  ),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "lbl_within_city".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "lbl_between_cities".tr,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
