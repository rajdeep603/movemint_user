import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/packer_details_between_cities_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_details_between_cities_provider.dart';

// ignore_for_file: must_be_immutable
class PackerDetailsBetweenCitiesPage extends StatefulWidget {
  const PackerDetailsBetweenCitiesPage({Key? key})
      : super(
          key: key,
        );

  @override
  PackerDetailsBetweenCitiesPageState createState() =>
      PackerDetailsBetweenCitiesPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerDetailsBetweenCitiesProvider(),
      child: PackerDetailsBetweenCitiesPage(),
    );
  }
}

class PackerDetailsBetweenCitiesPageState
    extends State<PackerDetailsBetweenCitiesPage>
    with AutomaticKeepAliveClientMixin<PackerDetailsBetweenCitiesPage> {
  @override
  bool get wantKeepAlive => true;
  TextEditingController dropController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 127.v),
              child: Column(
                children: [
                  SizedBox(height: 22.v),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPickupDrop(context),
                      SizedBox(height: 12.v),
                      _buildCheckbox(context),
                      SizedBox(height: 33.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "msg_services_we_offer".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                            SizedBox(height: 81.v),
                            CustomIconButton(
                              height: 40.adaptSize,
                              width: 40.adaptSize,
                              padding: EdgeInsets.all(12.h),
                              alignment: Alignment.centerRight,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgPlay,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.v),
                      _buildProcess(context),
                      _buildAction(context),
                    ],
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
  Widget _buildPickupDrop(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_pickup_from".tr,
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 9.v),
            Selector<PackerDetailsBetweenCitiesProvider,
                TextEditingController?>(
              selector: (
                context,
                provider,
              ) =>
                  provider.searchController,
              builder: (context, searchController, child) {
                return Container(
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(
                      10.h,
                    ),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.h,
                    ),
                  ),
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: dropController,
                    googleAPIKey: "AIzaSyBdGUa2fdwWq0iyEFsmqbdDjpQ8hqbtjtY",
                    inputDecoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      hintText: "Search your location",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    debounceTime: 400,
                    countries: ["in", "fr"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print("placeDetails" + prediction.lat.toString());
                    },

                    itemClick: (Prediction prediction) {
                      dropController.text = prediction.description ?? "";
                      dropController.selection = TextSelection.fromPosition(
                          TextPosition(
                              offset: prediction.description?.length ?? 0));
                    },
                    seperatedBuilder: Divider(),
                    containerHorizontalPadding: 10,

                    // OPTIONAL// If you want to customize list view item builder
                    itemBuilder: (context, index, Prediction prediction) {
                      return Container(
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: BorderRadius.circular(
                            10.h,
                          ),
                          border: Border.all(
                            color: appTheme.gray300,
                            width: 1.h,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 7,
                            ),
                            Expanded(
                                child: Text("${prediction.description ?? ""}"))
                          ],
                        ),
                      );
                    },

                    isCrossBtnShown: true,

                    // default 600 ms ,
                  ),
                );
                ;
              },
            ),
            SizedBox(height: 17.v),
            Text(
              "lbl_drop_location".tr,
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 9.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 17.h,
                vertical: 11.v,
              ),
              decoration: AppDecoration.outlineGray300.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder9,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgLinkedin,
                    height: 22.adaptSize,
                    width: 22.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.h),
                    child: SizedBox(
                      height: 20.v,
                      child: VerticalDivider(
                        width: 1.h,
                        thickness: 1.v,
                        endIndent: 2.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 2.v,
                    ),
                    child: Text(
                      "msg_search_destination".tr,
                      style: theme.textTheme.bodyLarge,
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

  /// Section Widget
  Widget _buildCheckbox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: Selector<PackerDetailsBetweenCitiesProvider, bool?>(
        selector: (
          context,
          provider,
        ) =>
            provider.checkbox,
        builder: (context, checkbox, child) {
          return CustomCheckboxButton(
            text: "msg_i_m_flexible_on".tr,
            value: checkbox,
            onChange: (value) {
              context
                  .read<PackerDetailsBetweenCitiesProvider>()
                  .changeCheckBox1(value);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildProcess(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.h,
          right: 13.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_how_it_worlks".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 22.v),
            Padding(
              padding: EdgeInsets.only(right: 79.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgStepSymbol,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    margin: EdgeInsets.only(
                      top: 5.v,
                      bottom: 9.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_share_your_shifting".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 3.v),
                        SizedBox(
                          width: 266.h,
                          child: Text(
                            "msg_lorem_ipsum_dolor".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgStepTrail,
              height: 50.v,
              width: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 91.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgStepSymbolWhiteA700,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    margin: EdgeInsets.only(
                      top: 8.v,
                      bottom: 6.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_receives_free_instant".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 6.v),
                        SizedBox(
                          width: 254.h,
                          child: Text(
                            "msg_lorem_ipsum_dolor2".tr,
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgStepTrail,
              height: 50.v,
              width: 32.h,
            ),
            Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgStepSymbolWhiteA70032x32,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 7.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "msg_assing_qualitiy".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 5.v),
                      SizedBox(
                        width: 345.h,
                        child: Text(
                          "msg_lorem_ipsum_dolor".tr,
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomImageView(
              imagePath: ImageConstant.imgStepTrailBlueGray200,
              height: 50.v,
              width: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 44.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgStepSymbol32x32,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 7.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_leave_the_heavy".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 5.v),
                        SizedBox(
                          width: 301.h,
                          child: Text(
                            "msg_lorem_ipsum_dolor3".tr,
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
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

  /// Section Widget
  Widget _buildAction(BuildContext context) {
    return SizedBox(
      height: 110.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
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
                children: [
                  SizedBox(height: 25.v),
                  CustomElevatedButton(
                    text: "lbl_next".tr,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
