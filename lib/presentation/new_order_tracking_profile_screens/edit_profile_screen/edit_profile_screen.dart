import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../order_details_screen/packer_summary_one_page.dart';
import 'models/edit_profile_model.dart';
import 'provider/edit_profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileProvider(),
      child: EditProfileScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          // color: Colors.red,
          width: width / 1,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 33.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_order_list".tr,
                style: CustomTextStyles.titleMediumGray900,
              ),
              SizedBox(height: 24.v),
              _buildHorizontalcard(context, width),
              SizedBox(height: 13.v),
              _buildHorizontalcard1(context, width),
              SizedBox(height: 5.v)
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottombar(context),
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
        text: "lbl_payment".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildHorizontalcard(BuildContext context, width) {
    return Container(
      width: width / 1.1,
      // margin: EdgeInsets.only(
      //   left: 2.h,
      //   right: 9.h,
      // ),
      // padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_movemint_credits".tr,
                  style: CustomTextStyles.titleSmallGray900,
                ),
                SizedBox(height: 4.v),
                Text(
                  "lbl_balance_1000".tr,
                  style: CustomTextStyles.bodySmallGray600,
                )
              ],
            ),
          ),
          Container(
            height: 30,
            width: width / 4.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green, width: 1.5)),
            child: Center(
              child: Text(
                "Add Money",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
          // CustomOutlinedButton(
          //   width: 98.h,
          //   text: "lbl_add_money".tr,
          //   buttonStyle: CustomButtonStyles.outlineGreenA,
          //   buttonTextStyle: CustomTextStyles.labelLargeGreenA700,
          // )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalcard1(BuildContext context, width) {
    return Container(
      width: width / 1.1,
      // margin: EdgeInsets.only(
      //   left: 2.h,
      //   right: 9.h,
      // ),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 16.h,
      //   vertical: 14.v,
      // ),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CustomImageView(
          //   imagePath: ImageConstant.imgImage194,
          //   height: 46.v,
          //   width: 56.h,
          //   margin: EdgeInsets.symmetric(vertical: 4.v),
          // ),
          Container(
              height: 70,
              width: 80,
              child: Image.network(
                  "https://1000logos.net/wp-content/uploads/2021/02/Paytm-emblem.png")
              // Icon(
              //   Icons.wallet,
              //   color: Colors.lightBlue,
              //   size: 70,
              // ),
              ),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_paytm_wallet".tr,
                  style: CustomTextStyles.titleSmallGray900,
                ),
                SizedBox(height: 2.v),
                SizedBox(
                  width: 171.h,
                  child: Text(
                    "msg_new_paytm_account".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallGray600.copyWith(
                      height: 1.33,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30,
            width: width / 4.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green, width: 1.5)),
            child: Center(
              child: Text(
                "Link Wallet",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          )
          // CustomOutlinedButton(
          //   width: 96.h,
          //   text: "lbl_link_wallet".tr,
          //   margin: EdgeInsets.symmetric(vertical: 7.v),
          //   buttonStyle: CustomButtonStyles.outlineGreenA,
          //   buttonTextStyle: CustomTextStyles.labelLargeGreenA700,
          // )
        ],
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
