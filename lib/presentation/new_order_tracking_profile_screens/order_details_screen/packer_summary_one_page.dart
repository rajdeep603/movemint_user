import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../packer_summary_one_container_screen/packer_summary_one_container_screen.dart';
import 'models/packer_summary_one_model.dart';
import 'provider/packer_summary_one_provider.dart'; // ignore_for_file: must_be_immutable

class PackerSummaryOnePage extends StatefulWidget {
  const PackerSummaryOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  PackerSummaryOnePageState createState() => PackerSummaryOnePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerSummaryOneProvider(),
      child: PackerSummaryOnePage(),
    );
  }
}

class PackerSummaryOnePageState extends State<PackerSummaryOnePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  _buildMovingdetails(context),
                  SizedBox(height: 20.v),
                  _buildRowcallpartner(context),
                  SizedBox(height: 30.v),
                  CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                      ),
                    ),
                    hintText: "lbl_all_items".tr,
                    // items: packerSummaryOneModelObj?.dropdownItemList ?? [],
                  ),
                  // Selector<PackerSummaryOneProvider, PackerSummaryOneModel?>(
                  //   selector: (context, provider) =>
                  //       provider.packerSummaryOneModelObj,
                  //   builder: (context, packerSummaryOneModelObj, child) {
                  //     return CustomDropDown(
                  //       icon: Container(
                  //         margin: EdgeInsets.symmetric(horizontal: 16.h),
                  //         child: CustomImageView(
                  //           imagePath: ImageConstant.imgArrowRight,
                  //           height: 12.adaptSize,
                  //           width: 12.adaptSize,
                  //         ),
                  //       ),
                  //       hintText: "lbl_all_items".tr,
                  //       items: packerSummaryOneModelObj?.dropdownItemList ?? [],
                  //     );
                  //   },
                  // ),
                  SizedBox(height: 5.v),
                  _buildDropdownmenu(context),
                  SizedBox(height: 30.v),
                  CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowRightPurple900,
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                      ),
                    ),
                    hintText: "lbl_bill_summary".tr,
                    // items:
                    // packerSummaryOneModelObj?.dropdownItemList1 ?? [],
                  )
                  // Selector<PackerSummaryOneProvider, PackerSummaryOneModel?>(
                  //   selector: (context, provider) =>
                  //       provider.packerSummaryOneModelObj,
                  //   builder: (context, packerSummaryOneModelObj, child) {
                  //     return CustomDropDown(
                  //       icon: Container(
                  //         margin: EdgeInsets.symmetric(horizontal: 16.h),
                  //         child: CustomImageView(
                  //           imagePath: ImageConstant.imgArrowRightPurple900,
                  //           height: 12.adaptSize,
                  //           width: 12.adaptSize,
                  //         ),
                  //       ),
                  //       hintText: "lbl_bill_summary".tr,
                  //       items:
                  //           packerSummaryOneModelObj?.dropdownItemList1 ?? [],
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
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
        text: "lbl_order_details".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildMovingdetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "lbl_order_14258".tr,
                style: CustomTextStyles.titleSmallGray900SemiBold,
              ),
              GestureDetector(
                onTap: () {
                  _showCancelOrderAlertDialog(context);
                },
                child: Text(
                  "lbl_cancel_order".tr,
                  style: CustomTextStyles.titleSmallRedA400,
                ),
              )
            ],
          ),
          SizedBox(height: 19.v),
          Container(
            decoration: AppDecoration.outlineGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.v,
                    bottom: 40.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(right: 15.h),
                        child: SizedBox(
                          height: 51.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                            color: appTheme.teal600,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                      )
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgIconsLocation,
                      //   height: 24.adaptSize,
                      //   width: 24.adaptSize,
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.h,
                    top: 20.v,
                    bottom: 20.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_from".tr,
                        style: CustomTextStyles.labelLargeGray900SemiBold,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "msg_9th_main_nehru".tr,
                        style: CustomTextStyles.labelLargeGray900SemiBold,
                      ),
                      SizedBox(height: 1.v),
                      Row(
                        children: [
                          Text(
                            "lbl_sender".tr,
                            style: CustomTextStyles.bodySmallGray900,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              "lbl_vaishak".tr,
                              style: CustomTextStyles.labelLargeGray900,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 45.v),
                      Text(
                        "lbl_delivery_to".tr,
                        style: CustomTextStyles.labelLargeGray900SemiBold,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "msg_bagmane_tech_park".tr,
                        style: CustomTextStyles.labelLargeGray900SemiBold,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text(
                              "lbl_receiver".tr,
                              style: CustomTextStyles.bodySmallGray900,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              "lbl_roy".tr,
                              style: CustomTextStyles.labelLargeGray900,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200.v,
                  width: 190.h,
                  child: Image.network(
                      "https://cdn.pixabay.com/photo/2019/07/19/09/54/map-4348394_1280.png"),
                )
                // Container(
                //   height: 184.v,
                //   width: 177.h,
                //   margin: EdgeInsets.only(left: 20.h),
                //   child: Stack(
                //     alignment: Alignment.bottomRight,
                //     children: [
                //       CustomImageView(
                //         imagePath: ImageConstant.imgRectangle3,
                //         height: 176.v,
                //         width: 177.h,
                //         radius: BorderRadius.horizontal(
                //           right: Radius.circular(10.h),
                //         ),
                //         alignment: Alignment.center,
                //       ),
                //       Align(
                //         alignment: Alignment.bottomRight,
                //         child: SizedBox(
                //           height: 434.v,
                //           width: 212.h,
                //           child: Stack(
                //             alignment: Alignment.topLeft,
                //             children: [
                //               CustomImageView(
                //                 imagePath:
                //                     ImageConstant.imgWhatsappImage20240227,
                //                 height: 434.v,
                //                 width: 212.h,
                //                 alignment: Alignment.center,
                //               ),
                //               Align(
                //                 alignment: Alignment.topLeft,
                //                 child: Container(
                //                   margin: EdgeInsets.only(
                //                     left: 19.h,
                //                     top: 25.v,
                //                     right: 50.h,
                //                   ),
                //                   padding: EdgeInsets.symmetric(
                //                     horizontal: 6.h,
                //                     vertical: 7.v,
                //                   ),
                //                   decoration: BoxDecoration(
                //                     image: DecorationImage(
                //                       image: fs.Svg(
                //                         ImageConstant.imgGroup5,
                //                       ),
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   child: Container(
                //                     height: 7.adaptSize,
                //                     width: 7.adaptSize,
                //                     decoration: BoxDecoration(
                //                       color: appTheme.gray90001,
                //                       borderRadius: BorderRadius.circular(
                //                         3.h,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(height: 20.v),
          Selector<PackerSummaryOneProvider, TextEditingController?>(
            selector: (context, provider) => provider.timeController,
            builder: (context, timeController, child) {
              return Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.black12)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Here...",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        suffix: Text(
                          "Edit",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                  )

                  // CustomTextFormField(
                  //   controller: timeController,
                  //   hintText: "Enter here..",
                  //   textInputAction: TextInputAction.done,
                  //   suffix: Padding(
                  //     padding: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
                  //     child: Text(
                  //       "lbl_edit".tr,
                  //       style: TextStyle(
                  //         color: Color(0XFF00BD6D),
                  //         fontSize: 14.fSize,
                  //         fontFamily: 'Inter',
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  //   suffixConstraints: BoxConstraints(
                  //     maxHeight: 48.v,
                  //   ),
                  // ),
                  );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowcallpartner(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomOutlinedButton(
              height: 45.v,
              text: "lbl_call_partner".tr,
              margin: EdgeInsets.only(right: 10.h),
              leftIcon: Container(
                margin: EdgeInsets.only(right: 8.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgCall,
                  height: 19.v,
                  width: 15.h,
                ),
              ),
              buttonTextStyle: CustomTextStyles.titleSmallBold,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              onPressed: () {
                NavigatorService.pushNamed(
                  AppRoutes.packerSummaryOneOneScreen,
                );
              },
              height: 45.v,
              text: "lbl_live_tracking".tr,
              margin: EdgeInsets.only(left: 10.h),
              buttonTextStyle: CustomTextStyles.titleMediumRaleway,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDropdownmenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12.h, 14.v, 12.h, 13.v),
            decoration: AppDecoration.outlineGray30001,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  child: Text(
                    "lbl_chair".tr,
                    style: CustomTextStyles.titleSmallGray900_1,
                  ),
                ),
                _buildNumberinput(
                  context,
                  onehundredtwent: "lbl_1".tr,
                )
              ],
            ),
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
                    "lbl_tables".tr,
                    style: CustomTextStyles.titleSmallGray900_1,
                  ),
                ),
                _buildNumberinput(
                  context,
                  onehundredtwent: "lbl_1".tr,
                )
              ],
            ),
          ),
          SizedBox(height: 14.v)
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildNumberinput(
    BuildContext context, {
    required String onehundredtwent,
  }) {
    return Row(
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
            onehundredtwent,
            style: CustomTextStyles.titleSmallGray900SemiBold.copyWith(
              color: appTheme.gray900,
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
        )
      ],
    );
  }

  Future<void> _showCancelOrderAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          elevation: 15,
          backgroundColor: Colors.red.shade100,
          title: const Center(
              child: Text(
            'Cancel Order!',
            style: TextStyle(
                color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600),
          )),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(
                    'Are you sure want to cancel your order?',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PackerSummaryOnePage()));
                        // Navigator.pop(context);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NewLeaveScreen()));
                        // Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
