import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/utils/toast_helper.dart';
import '../../domain/providers/create_order_provider.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../packer_details_between_cities_page/packer_details_between_cities_page.dart';
import '../packer_details_within_city_page/packer_details_within_city_page.dart';
import 'provider/packer_location_set_provider.dart';

class PackerLocationSetScreen extends StatefulWidget {
  const PackerLocationSetScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PackerLocationSetProvider>(
      create: (BuildContext context) => PackerLocationSetProvider(context),
      child: const PackerLocationSetScreen(),
    );
  }

  @override
  PackerLocationSetScreenState createState() => PackerLocationSetScreenState();
}

class PackerLocationSetScreenState extends State<PackerLocationSetScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabviewController.dispose();
    super.dispose();
  }

  late PackerLocationSetProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<PackerLocationSetProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 38.v),
            child: SizedBox(
              height: 800.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  _buildFrame(context),
                  Container(
                    margin: EdgeInsets.only(top: 127.v),
                    height: 638.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: <Widget>[
                        PackerDetailsWithinCityPage.builder(context, provider),
                        PackerDetailsBetweenCitiesPage.builder(
                            context, provider),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.v),
                  _buildNextButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return SizedBox(
      height: 110.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 107.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.h),
              decoration: AppDecoration.outlineGray3001,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 25.v),
                  CustomElevatedButton(
                    text: "lbl_next".tr,
                    onPressed: () {
                      final CreateOrderProvider createProvider =
                          context.read<CreateOrderProvider>();
                      if (tabviewController.index == 0 &&
                          createProvider.searchCityController.text.isEmpty) {
                        ToastHelper.showToast('Please enter city');
                        return;
                      }
                      if (createProvider.dropLocationController.text.isEmpty) {
                        ToastHelper.showToast('Please enter drop location');
                        return;
                      }
                      if (createProvider
                          .pickUpLocationController.text.isEmpty) {
                        ToastHelper.showToast('Please enter drop location');
                        return;
                      }
                      NavigatorService.pushNamed(
                          AppRoutes.packerDetailsDateTimeScreen);
                    },
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        onTap: () {
          context.read<CreateOrderProvider>().disposeValues();
          NavigatorService.goBack();
        },
        imagePath: ImageConstant.imgLeftButton,
        margin: EdgeInsets.only(left: 24.h, top: 37.v, bottom: 29.v),
      ),
      centerTitle: true,
      title: AppbarTitle(text: 'lbl_details'.tr),
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
          children: <Widget>[
            SizedBox(
              height: 85.v,
              width: 350.h,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(right: 254.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CustomImageView(
                            imagePath: ImageConstant.imgClock,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          SizedBox(height: 11.v),
                          Text(
                            'lbl_details'.tr,
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
                        children: <Widget>[
                          CustomImageView(
                            imagePath: ImageConstant.imgContrastGray300,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          SizedBox(height: 12.v),
                          Text(
                            'lbl_add_items'.tr,
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
                        children: <Widget>[
                          CustomImageView(
                            imagePath: ImageConstant.imgContrastGray300,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          SizedBox(height: 13.v),
                          Text(
                            'lbl_summary'.tr,
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
              // width: 390.h,
              decoration: BoxDecoration(
                  color: appTheme.gray10001,
                  borderRadius: BorderRadius.circular(10.h)),
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
                indicator: BoxDecoration(
                  color: appTheme.purple900,
                  borderRadius: BorderRadius.circular(12.h),
                ),
                tabs: <Widget>[
                  Tab(
                    child: Center(
                      child: Text('lbl_within_city'.tr),
                    ),
                  ),
                  Tab(
                    child: Center(
                      child: Text('lbl_between_cities'.tr),
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
