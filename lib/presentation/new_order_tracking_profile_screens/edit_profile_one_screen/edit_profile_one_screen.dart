import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../order_details_screen/packer_summary_one_page.dart';
import 'models/edit_profile_one_model.dart';
import 'provider/edit_profile_one_provider.dart';

class EditProfileOneScreen extends StatefulWidget {
  const EditProfileOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EditProfileOneScreenState createState() => EditProfileOneScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileOneProvider(),
      child: EditProfileOneScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class EditProfileOneScreenState extends State<EditProfileOneScreen> {
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 30.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    height: 67.adaptSize,
                    width: 67.adaptSize,
                    decoration: IconButtonStyleHelper.fillDeepPurpleTL33,
                    child: Icon(
                      Icons.person,
                      color: Colors.purple,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 10.v,
                      bottom: 10.v,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "lbl_user_name".tr,
                          style: CustomTextStyles.titleMediumPoppinsGray900,
                        ),
                        SizedBox(height: 4.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.note_alt_sharp,
                              color: Colors.green,
                              size: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text(
                                "lbl_edit_profile".tr,
                                style: CustomTextStyles.labelLargeTeal600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.v),
              CustomOutlinedButton(
                height: 48.v,
                text: "msg_add_gst_details".tr,
                buttonTextStyle: CustomTextStyles.labelLargeTeal60012,
              ),
              SizedBox(height: 20.v),
              Text(
                "lbl_benifits".tr,
                style: CustomTextStyles.titleSmallBluegray900,
              ),
              SizedBox(height: 20.v),
              Row(
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.green,
                    size: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_refer_and_earn".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  )
                ],
              ),
              SizedBox(height: 26.v),
              Divider(
                thickness: 1,
                color: Colors.black26,
              ),
              SizedBox(height: 20.v),
              Text(
                "lbl_support_legal".tr,
                style: CustomTextStyles.titleSmallBluegray900,
              ),
              SizedBox(height: 18.v),
              Row(
                children: [
                  Icon(
                    Icons.headset_mic,
                    color: Colors.green,
                    size: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 2.v,
                    ),
                    child: Text(
                      "lbl_contact_support".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.v),
              Row(
                children: [
                  Icon(
                    Icons.sticky_note_2_sharp,
                    color: Colors.green,
                    size: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_terms_conditions".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.v),
              Divider(
                thickness: 1,
                color: Colors.black26,
              ),
              SizedBox(height: 10.v),
              Text(
                "lbl_settings".tr,
                style: CustomTextStyles.titleSmallBluegray900,
              ),
              SizedBox(height: 18.v),
              _buildField(context),
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
        text: "lbl_profile".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildField(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.login,
          color: Colors.green,
          size: 20,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 3.v,
          ),
          child: Text(
            "lbl_logout".tr,
            style: theme.textTheme.titleSmall,
          ),
        )
      ],
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
