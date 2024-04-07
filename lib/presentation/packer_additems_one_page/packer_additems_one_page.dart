import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../packer_summary_one_screen/packer_summary_one_screen.dart';
import '../packer_summary_one_screen/summary_one_screen.dart';
import '../packer_summary_two_screen/packer_summary_two_screen.dart';
import 'models/packer_additems_one_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_additems_one_provider.dart';

// ignore_for_file: must_be_immutable
class PackerAdditemsOnePage extends StatefulWidget {
  const PackerAdditemsOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  PackerAdditemsOnePageState createState() => PackerAdditemsOnePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerAdditemsOneProvider(),
      child: PackerAdditemsOnePage(),
    );
  }
}

class PackerAdditemsOnePageState extends State<PackerAdditemsOnePage>
    with AutomaticKeepAliveClientMixin<PackerAdditemsOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
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
                    _buildHorizontalCard(context),
                    SizedBox(height: 13.v),
                    _buildHorizontalCard1(context),
                    SizedBox(height: 13.v),
                    _buildHorizontalCard2(context),
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
  Widget _buildHorizontalCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h),
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
  Widget _buildHorizontalCard2(BuildContext context) {
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
                    top: 41.v,
                    bottom: 16.v,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_total_items".tr,
                          style: CustomTextStyles.titleMediumInterff71727a,
                        ),
                        TextSpan(
                          text: "lbl_0".tr,
                          style: CustomTextStyles.titleMediumInterff000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SummaryOne()));
                  },
                  width: 224.h,
                  text: "test_next",
                  // text: "lbl_next".tr,
                  margin: EdgeInsets.only(top: 25.v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
