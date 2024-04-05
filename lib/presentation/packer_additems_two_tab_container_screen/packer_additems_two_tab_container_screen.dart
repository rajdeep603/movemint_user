import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../packer_additems_one_page/packer_additems_one_page.dart';
import 'models/packer_additems_two_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_additems_two_tab_container_provider.dart';

class PackerAdditemsTwoTabContainerScreen extends StatefulWidget {
  const PackerAdditemsTwoTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PackerAdditemsTwoTabContainerScreenState createState() =>
      PackerAdditemsTwoTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerAdditemsTwoTabContainerProvider(),
      child: PackerAdditemsTwoTabContainerScreen(),
    );
  }
}

class PackerAdditemsTwoTabContainerScreenState
    extends State<PackerAdditemsTwoTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
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
            child: Column(
              children: [
                SizedBox(
                  height: 60.v,
                  width: 350.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // height: 300,
                          // margin: EdgeInsets.only(right: 254.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                child: Stack(
                                  alignment: Alignment.center,
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
                                      width: 10.h,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 11.v),
                              Text(
                                "lbl_details".tr,
                                style:
                                    CustomTextStyles.labelLargePrimaryContainer,
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
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgPlay,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              SizedBox(height: 12.v),
                              Text(
                                "lbl_add_items".tr,
                                style:
                                    CustomTextStyles.labelLargePrimaryContainer,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 300,
                          margin: EdgeInsets.only(left: 238.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
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
                _buildTabview(context),
                SizedBox(
                  height: 638.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      PackerAdditemsOnePage.builder(context),
                      PackerAdditemsOnePage.builder(context),
                      PackerAdditemsOnePage.builder(context),
                      PackerAdditemsOnePage.builder(context),
                    ],
                  ),
                ),
              ],
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
        imagePath: ImageConstant.imgLeftButtonOnerrorcontainer,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 37.v,
          bottom: 29.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_add_items".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 48.v,
      width: 390.h,
      decoration: BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(
          16.h,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TabBar(
          controller: tabviewController,
          labelPadding: EdgeInsets.zero,
          // labelColor: theme.colorScheme.onErrorContainer,
          labelColor: appTheme.gray50,
          labelStyle: TextStyle(
            fontSize: 12.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
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
                "lbl_household".tr,
                // style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "lbl_commercial".tr,
              ),
            ),
            Tab(
              child: Text(
                "lbl_electronics".tr,
              ),
            ),
            Tab(
              child: Text(
                "lbl_other".tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
