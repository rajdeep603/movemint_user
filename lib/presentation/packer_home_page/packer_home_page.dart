import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../core/app_export.dart';
import '../../domain/models/get_orders_model.dart';
import '../../domain/providers/order_list_repo_provider.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import '../order_list_screen/order_list_provder.dart';
import '../packer_location_set_screen/packer_location_set_screen.dart';
import 'provider/packer_home_provider.dart';

// ignore_for_file: must_be_immutable
class PackerHomePage extends StatefulWidget {
  const PackerHomePage({Key? key})
      : super(
          key: key,
        );

  @override
  PackerHomePageState createState() => PackerHomePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerHomeProvider(),
      child: PackerHomePage(),
    );
  }
}

class PackerHomePageState extends State<PackerHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopSection(context),
                SizedBox(height: 39.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 21.h),
                    child: Text(
                      "lbl_our_services".tr,
                      style: CustomTextStyles.titleMediumGray900SemiBold,
                    ),
                  ),
                ),
                SizedBox(height: 17.v),
                _buildFrame(context),
                SizedBox(height: 30.v),
                _buildText(context),
                SizedBox(height: 30.v),
                _buildHeader(context),
                SizedBox(height: 12.v),
                _buildHistoryCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 27.v,
      ),
      decoration: AppDecoration.fillPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup,
                  height: 24.v,
                  width: 193.h,
                  margin: EdgeInsets.only(top: 7.v),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsNotifications,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            "lbl_pickup_from".tr,
            style: CustomTextStyles.titleMediumWhiteA700SemiBold,
          ),
          SizedBox(height: 9.v),
          Container(
            padding: EdgeInsets.all(18.h),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder9,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 23.adaptSize,
                  width: 23.adaptSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgContrast,
                        height: 23.adaptSize,
                        width: 23.adaptSize,
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 8.adaptSize,
                          width: 8.adaptSize,
                          decoration: BoxDecoration(
                            color: appTheme.green400,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 13.h),
                  child: SizedBox(
                    height: 22.v,
                    child: VerticalDivider(
                      width: 1.h,
                      thickness: 1.v,
                      indent: 2.h,
                      endIndent: 2.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "msg_9th_main_nehru_street".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 19.h,
        right: 22.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              NavigatorService.pushNamed(AppRoutes.packerLocationSetScreen);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 11.v,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame1171281255,
                    height: 95.v,
                    width: 155.h,
                  ),
                  SizedBox(height: 19.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "msg_truck_two_wheeler".tr,
                            style: CustomTextStyles.labelLargeGray900,
                          ),
                          SizedBox(height: 2.v),
                          Text(
                            "msg_choose_your_vehicle".tr,
                            style: theme.textTheme.labelSmall,
                          ),
                        ],
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 27.adaptSize,
                        width: 27.adaptSize,
                        margin: EdgeInsets.only(left: 9.h),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              NavigatorService.pushNamed(AppRoutes.packerLocationSetScreen);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 11.v,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup1171281254,
                    height: 95.v,
                    width: 155.h,
                  ),
                  SizedBox(height: 14.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_packer_mover".tr,
                            style: CustomTextStyles.labelLargeGray900,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            "msg_choose_your_vehicle".tr,
                            style: theme.textTheme.labelSmall,
                          ),
                        ],
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 27.adaptSize,
                        width: 27.adaptSize,
                      ),
                    ],
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
  Widget _buildText(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 21.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_get_a_10_discount".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 7.v),
          Row(
            children: [
              Container(
                width: 185.h,
                margin: EdgeInsets.only(top: 1.v),
                child: Text(
                  "msg_you_can_save_up".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodySmallGray10002.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              CustomElevatedButton(
                height: 36.v,
                width: 92.h,
                text: "lbl_claim_now".tr,
                margin: EdgeInsets.only(left: 68.h),
                buttonStyle: CustomButtonStyles.fillWhiteA,
                buttonTextStyle: theme.textTheme.labelMedium!,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 4.v,
              bottom: 1.v,
            ),
            child: Text(
              "lbl_recent_shipping".tr,
              style: CustomTextStyles.titleMediumGray900SemiBold,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 27.adaptSize,
            width: 27.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHistoryCard(BuildContext context) {
    return Consumer<GetOrdersListRepoProvider>(builder: (BuildContext context,
        GetOrdersListRepoProvider orderListProvider, Widget? child) {
      return Column(
        children: [
          Container(
            height: 300.v,
            // width:
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 21.h,
              vertical: 17.v,
            ),
            decoration: AppDecoration.outlineGray100,
            child: orderListProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : orderListProvider.getOrderModel == null
                    ? Text(
                        'No Order Found',
                        style: CustomTextStyles.labelLargeMedium,
                      )
                    : ListView.builder(
                        itemCount:
                            orderListProvider.getOrderModel!.orders?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Order order =
                              orderListProvider.getOrderModel!.orders![index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.v),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.v, horizontal: 15.h),
                              color: appTheme.gray50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 172.v),
                                    child: CustomIconButton(
                                      height: 46.adaptSize,
                                      width: 46.adaptSize,
                                      padding: EdgeInsets.all(9.h),
                                      decoration:
                                          IconButtonStyleHelper.fillGreen,
                                      child: CustomImageView(
                                        imagePath: ImageConstant.imgUser,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 18.h,
                                        top: 3.v,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 316.h,
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '# ${order.id} ',
                                                      style: CustomTextStyles
                                                          .titleSmallMedium,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 9.h,
                                                        bottom: 2.v,
                                                      ),
                                                      child: Text(
                                                        order.datetime?.format(
                                                                DateTimeUtils
                                                                    .dMonFormat) ??
                                                            'NA',
                                                        style: CustomTextStyles
                                                            .bodyLargeOnPrimaryContainer,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Container(
                                                //   height: 4.adaptSize,
                                                //   width: 4.adaptSize,
                                                //   margin: EdgeInsets.only(
                                                //     left: 9.h,
                                                //     top: 9.v,
                                                //     bottom: 9.v,
                                                //   ),
                                                //   decoration: BoxDecoration(
                                                //     color: appTheme.blueGray100,
                                                //     borderRadius: BorderRadius.circular(
                                                //       2.h,
                                                //     ),
                                                //   ),
                                                // ),
                                                Spacer(),
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgNotification,
                                                  height: 23.adaptSize,
                                                  width: 23.adaptSize,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 22.v),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 33.h),
                                            child: Row(
                                              children: [
                                                CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgVector,
                                                  height: 101.v,
                                                  width: 5.h,
                                                  margin: EdgeInsets.only(
                                                    top: 7.v,
                                                    bottom: 8.v,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 14.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "lbl_from".tr,
                                                          style: CustomTextStyles
                                                              .bodyLargeOnPrimaryContainer,
                                                        ),
                                                        SizedBox(height: 9.v),
                                                        Text(
                                                          order.from.toString(),
                                                          style: CustomTextStyles
                                                              .bodyLargeBluegray400,
                                                        ),
                                                        SizedBox(height: 19.v),
                                                        Text(
                                                          "lbl_to".tr,
                                                          style: CustomTextStyles
                                                              .bodyLargeOnPrimaryContainer,
                                                        ),
                                                        SizedBox(height: 9.v),
                                                        Text(
                                                          order.to.toString(),
                                                          style: CustomTextStyles
                                                              .bodyLargeBluegray400,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 23.v),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 1.v,
                                                  bottom: 8.v,
                                                ),
                                                child: Text(
                                                  "msg_delivery_status".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumBluegray400,
                                                ),
                                              ),
                                              Container(
                                                width: 83.h,
                                                margin:
                                                    EdgeInsets.only(left: 18.h),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 11.h,
                                                  vertical: 2.v,
                                                ),
                                                decoration: AppDecoration
                                                    .fillGreen
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder9,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    order.status ?? "NA",
                                                    style: CustomTextStyles
                                                        .bodySmallPrimary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
          ),
        ],
      );
    });
  }
}
