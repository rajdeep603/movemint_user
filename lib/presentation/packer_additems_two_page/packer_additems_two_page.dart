import '../../core/app_export.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/packer_additems_two_provider.dart';

// ignore_for_file: must_be_immutable
class PackerAdditemsTwoPage extends StatefulWidget {
  const PackerAdditemsTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  PackerAdditemsTwoPageState createState() => PackerAdditemsTwoPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerAdditemsTwoProvider(),
      child: PackerAdditemsTwoPage(),
    );
  }
}

class PackerAdditemsTwoPageState extends State<PackerAdditemsTwoPage>
    with AutomaticKeepAliveClientMixin<PackerAdditemsTwoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.packerAdditemsScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.v),
                Column(
                  children: [
                    _buildList(context),
                    SizedBox(height: 15.v),
                    _buildHorizontalCard(context),
                    SizedBox(height: 13.v),
                    _buildHorizontalCard1(context),
                    SizedBox(height: 21.v),
                    _buildActionBottom2(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillGray5001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_living_room".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      "lbl_5_items".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRightPurple900,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 11.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Container(
            padding: EdgeInsets.all(12.h),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDropdownOption(
                  context,
                  tables: "lbl_chair".tr,
                  oneHundredTwentyThree: "lbl_1".tr,
                ),
                _buildDropdownOption(
                  context,
                  tables: "lbl_tables".tr,
                  oneHundredTwentyThree: "lbl_1".tr,
                ),
                _buildDropdownOption1(
                  context,
                  cabinet: "lbl_tv".tr,
                  oneHundredTwentyThree: "lbl_0".tr,
                ),
                _buildDropdownOption1(
                  context,
                  cabinet: "lbl_cabinet".tr,
                  oneHundredTwentyThree: "lbl_0".tr,
                ),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.v),
                        child: Text(
                          "lbl_sofa".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      _buildNumberInputField(
                        context,
                        oneHundredTwentyThree: "lbl_0".tr,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_bedroom_room".tr,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 3.v),
                Text(
                  "lbl_5_items".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPurple900,
            height: 12.adaptSize,
            width: 12.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 12.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalCard1(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_kitchen".tr,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 3.v),
                Text(
                  "lbl_5_items".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPurple900,
            height: 12.adaptSize,
            width: 12.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 12.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildActionBottom2(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillOnErrorContainer,
      child: Column(
        children: [
          SizedBox(height: 32.v),
          Container(
            width: double.maxFinite,
            decoration: AppDecoration.outlineGray300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 26.v,
                    bottom: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_total_items".tr,
                              style: CustomTextStyles.titleMediumInterff71727a,
                            ),
                            TextSpan(
                              text: "lbl_2".tr,
                              style: CustomTextStyles.titleMediumInterff000000,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.v),
                      Selector<PackerAdditemsTwoProvider, bool?>(
                        selector: (
                          context,
                          provider,
                        ) =>
                            provider.viewAll,
                        builder: (context, viewAll, child) {
                          return CustomCheckboxButton(
                            width: 86.h,
                            text: "lbl_view_all".tr,
                            value: viewAll,
                            isRightCheck: true,
                            onChange: (value) {
                              context
                                  .read<PackerAdditemsTwoProvider>()
                                  .changeCheckBox1(value);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  width: 224.h,
                  text: "lbl_next".tr,
                  margin: EdgeInsets.only(top: 25.v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDropdownOption(
    BuildContext context, {
    required String tables,
    required String oneHundredTwentyThree,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.h, 14.v, 12.h, 13.v),
      decoration: AppDecoration.outlineDeepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: Text(
              tables,
              style: CustomTextStyles.titleSmallMedium.copyWith(
                color: theme.colorScheme.primaryContainer,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgMinus,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 3.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    oneHundredTwentyThree,
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(7.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgAdd,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDropdownOption1(
    BuildContext context, {
    required String cabinet,
    required String oneHundredTwentyThree,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.h, 14.v, 12.h, 13.v),
      decoration: AppDecoration.outlineDeepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: Text(
              cabinet,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: appTheme.gray600,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgMinus,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 3.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    oneHundredTwentyThree,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: appTheme.gray600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(7.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgAdd,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildNumberInputField(
    BuildContext context, {
    required String oneHundredTwentyThree,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 24.adaptSize,
            width: 24.adaptSize,
            padding: EdgeInsets.all(7.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgMinus,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 3.v,
              bottom: 3.v,
            ),
            child: Text(
              oneHundredTwentyThree,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: appTheme.gray600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomIconButton(
              height: 24.adaptSize,
              width: 24.adaptSize,
              padding: EdgeInsets.all(7.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgAdd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
