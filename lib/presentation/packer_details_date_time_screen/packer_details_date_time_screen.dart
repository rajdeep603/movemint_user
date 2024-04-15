import '../../core/app_export.dart';
import '../../domain/providers/create_order_provider.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../packer_additems_three_bottomsheet/packer_additems_three_bottomsheet.dart';
import '../packer_additems_two_page/packer_additems_two_page.dart';
import '../packer_additems_two_tab_container_screen/packer_additems_two_tab_container_screen.dart';
import 'models/frame_item_model.dart';
import '../packer_details_date_time_screen/widgets/frame_item_widget.dart';
import 'models/frame2_item_model.dart';
import '../packer_details_date_time_screen/widgets/frame2_item_widget.dart';
import 'models/packer_details_date_time_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_details_date_time_provider.dart';

class PackerDetailsDateTimeScreen extends StatefulWidget {
  const PackerDetailsDateTimeScreen({super.key});

  @override
  PackerDetailsDateTimeScreenState createState() =>
      PackerDetailsDateTimeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PackerDetailsDateTimeProvider>(
        create: (context) => PackerDetailsDateTimeProvider(context),
        child: PackerDetailsDateTimeScreen());
  }
}

class PackerDetailsDateTimeScreenState
    extends State<PackerDetailsDateTimeScreen> {
  // PackerDetailsDateTimeProvider packerDetailsDateTimeProvider =
  //     PackerDetailsDateTimeProvider();
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed(
    //     AppRoutes.packerAdditemsTwoTabContainerScreen,
    //   );
    // });
  }

  late PackerDetailsDateTimeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<PackerDetailsDateTimeProvider>(context);
    // PackerDetailsDateTimeProvider packerDetailsDateTimeProvider =
    //     Provider.of<PackerDetailsDateTimeProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 38.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 5.v),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 85.v,
                                      width: 350.h,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 254.h),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder9,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgClock,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize,
                                                  ),
                                                  SizedBox(height: 11.v),
                                                  Text(
                                                    'lbl_details'.tr,
                                                    style: CustomTextStyles
                                                        .labelLargePrimaryContainer,
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
                                                  bottom: 20),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder9,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgContrastGray300,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize,
                                                  ),
                                                  SizedBox(height: 12.v),
                                                  Text(
                                                    'lbl_add_items'.tr,
                                                    style: CustomTextStyles
                                                        .labelLargeGray300,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 238.h, bottom: 20),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder9,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgContrastGray300,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize,
                                                  ),
                                                  SizedBox(height: 13.v),
                                                  Text(
                                                    'lbl_summary'.tr,
                                                    style: CustomTextStyles
                                                        .labelLargeGray300,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                top: 12.v,
                                              ),
                                              child: SizedBox(
                                                width: 158.h,
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
                                              padding: EdgeInsets.only(
                                                  top: 12.v, right: 2),
                                              child: SizedBox(
                                                width: 163.h,
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
                                    SizedBox(height: 33.v),
                                    _buildDatePicker(context),
                                    SizedBox(height: 15.v),
                                    _buildDateListWidget(context),
                                    SizedBox(height: 26.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("msg_select_pickup_slot".tr,
                                            style:
                                                CustomTextStyles.titleSmall_1)),
                                    SizedBox(height: 13.v),
                                    _buildTmingsWidget(context),
                                    SizedBox(height: 203.v),
                                    _buildToast(context)
                                  ]))))
                    ])),
            bottomNavigationBar: _buildAction(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            onTap: () {
              NavigatorService.goBack();
            },
            imagePath: ImageConstant.imgLeftButtonOnerrorcontainer,
            margin: EdgeInsets.only(left: 24.h, top: 37.v, bottom: 29.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_details".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildDatePicker(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    dateController.text = context
        .read<CreateOrderProvider>()
        .selectedDate
        .format(DateTimeUtils.dMonYFormat);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "lbl_whe".tr, style: CustomTextStyles.titleSmallff1f2024),
            TextSpan(
                text: "msg_n_do_you_need_the".tr,
                style: CustomTextStyles.titleSmallff1f2024_1)
          ]),
          textAlign: TextAlign.left),
      SizedBox(height: 6.v),
      Container(
        decoration: BoxDecoration(
          color: appTheme.whiteA700,
          borderRadius: BorderRadius.circular(10.h),
          border: Border.all(color: Colors.transparent, width: 1.h),
        ),
        child: CustomTextFormField(
            controller: dateController,
            hintText: 'Please select date',
            textInputAction: TextInputAction.done,
            readOnly: true,
            suffix: CustomImageView(
                onTap: () => provider.onDatePickedEvent(context),
                imagePath: ImageConstant.imgUilcalender,
                height: 24.adaptSize,
                width: 24.adaptSize),
            suffixConstraints: BoxConstraints(maxHeight: 48.v)),
      )
    ]);
  }

  /// Section Widget
  Widget _buildDateListWidget(BuildContext context) {
    return Consumer<PackerDetailsDateTimeProvider>(
        builder: (context, provider, child) {
      return Wrap(
          runSpacing: 10.v,
          spacing: 10.h,
          children:
              List<Widget>.generate(provider.dateTimeList.length, (index) {
            final DateTimeListModel model = provider.dateTimeList[index];
            return FrameItemWidget(model, onSelectedChipView1: (bool value) {
              provider.onDateSelected(index, value, context);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildTmingsWidget(BuildContext context) {
    return Consumer<PackerDetailsDateTimeProvider>(
        builder: (context, provider, child) {
      return Wrap(
          runSpacing: 10.v,
          spacing: 10.h,
          children: List<Widget>.generate(
              provider.packerDetailsDateTimeModelObj.frame2ItemList.length,
              (index) {
            Frame2ItemModel model =
                provider.packerDetailsDateTimeModelObj.frame2ItemList[index];
            return Frame2ItemWidget(model, onSelectedChipView2: (value) {
              provider.onTimeSelected(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildToast(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
        decoration: AppDecoration.fillOrange
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgLeftIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 14.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_warning".tr,
                            style: CustomTextStyles.labelLargePrimaryContainer),
                        SizedBox(height: 2.v),
                        SizedBox(
                            width: 290.h,
                            child: Text("msg_move_during_weekends".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallErrorContainer
                                    .copyWith(height: 1.33)))
                      ]))),
          CustomImageView(
              imagePath: ImageConstant.imgClose,
              height: 12.adaptSize,
              width: 12.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 20.v, bottom: 20.v))
        ]));
  }

  /// Section Widget
  Widget _buildAction(BuildContext context) {
    return Container(
        height: 110.v,
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 1.v),
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 107.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: appTheme.whiteA700))),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.h),
                  decoration: AppDecoration.outlineGray3001,
                  child: CustomElevatedButton(
                      onPressed: () {
                        NavigatorService.pushNamed(
                            AppRoutes.packerAdditemsScreen);
                      },
                      // text: "detail next",
                      text: "lbl_next".tr,
                      margin: EdgeInsets.only(top: 25.v))))
        ]));
  }
}
