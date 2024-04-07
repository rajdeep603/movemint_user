import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import '../../core/app_export.dart';
import '../../domain/providers/create_order_provider.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../packer_location_set_screen/provider/packer_location_set_provider.dart';

class PackerDetailsBetweenCitiesPage extends StatelessWidget {
  const PackerDetailsBetweenCitiesPage({super.key, required this.provider});

  final PackerLocationSetProvider provider;

  static Widget builder(
      BuildContext context, PackerLocationSetProvider provider) {
    return PackerDetailsBetweenCitiesPage(provider: provider);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.v),
              _buildPickUpLocationWidget(context),
              SizedBox(height: 20.v),
              _buildDropLocationWidget(context),
              SizedBox(height: 12.v),
              _buildCheckbox(context),
              SizedBox(height: 33.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("msg_services_we_offer".tr,
                        style: theme.textTheme.titleMedium),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickUpLocationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("lbl_pickup_from".tr, style: theme.textTheme.labelLarge),
        SizedBox(height: 10.v),
        Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(10.h),
            border: Border.all(color: Colors.transparent, width: 1.h),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 20),
          child: GooglePlaceAutoCompleteTextField(
            textEditingController:  context.read<CreateOrderProvider>().pickUpLocationController,
            googleAPIKey: "AIzaSyBdGUa2fdwWq0iyEFsmqbdDjpQ8hqbtjtY",
            inputDecoration: const InputDecoration(
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              hintText: "PickUp Location",
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            debounceTime: 400,
            countries: <String>["in", "fr"],
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: (Prediction prediction) {
              print("placeDetails" + prediction.lat.toString());
            },

            itemClick: (Prediction prediction) {
              context.read<CreateOrderProvider>().pickUpLocationController.text =
                  prediction.description ?? "";
              context.read<CreateOrderProvider>().pickUpLocationController.selection =
                  TextSelection.fromPosition(TextPosition(
                      offset: prediction.description?.length ?? 0));
            },
            seperatedBuilder: const Divider(),
            containerHorizontalPadding: 10,

            // OPTIONAL// If you want to customize list view item builder
            itemBuilder:
                (BuildContext context, int index, Prediction prediction) {
              return Container(
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(10.h),
                  border: Border.all(color: appTheme.gray300, width: 1.h),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.location_on),
                    const SizedBox(width: 7),
                    Expanded(child: Text("${prediction.description ?? ""}"))
                  ],
                ),
              );
            },

            isCrossBtnShown: true,

            // default 600 ms ,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDropLocationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("lbl_drop_location".tr, style: theme.textTheme.labelLarge),
        SizedBox(height: 10.v),
        Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(10.h),
            border: Border.all(color: Colors.transparent, width: 1.h),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 20),
          child: GooglePlaceAutoCompleteTextField(
            textEditingController: context.read<CreateOrderProvider>().dropLocationController,
            googleAPIKey: "AIzaSyBdGUa2fdwWq0iyEFsmqbdDjpQ8hqbtjtY",
            inputDecoration: const InputDecoration(
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              hintText: "Drop Location",
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            debounceTime: 400,
            countries: <String>["in", "fr"],
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: (Prediction prediction) {
              print("placeDetails" + prediction.lat.toString());
            },

            itemClick: (Prediction prediction) {
              context.read<CreateOrderProvider>().dropLocationController.text =
                  prediction.description ?? "";
              context.read<CreateOrderProvider>().dropLocationController.selection =
                  TextSelection.fromPosition(TextPosition(
                      offset: prediction.description?.length ?? 0));
            },
            seperatedBuilder: const Divider(),
            containerHorizontalPadding: 10,

            // OPTIONAL// If you want to customize list view item builder
            itemBuilder:
                (BuildContext context, int index, Prediction prediction) {
              return Container(
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(10.h),
                  border: Border.all(color: appTheme.gray300, width: 1.h),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.location_on),
                    const SizedBox(width: 7),
                    Expanded(child: Text("${prediction.description ?? ""}"))
                  ],
                ),
              );
            },

            isCrossBtnShown: true,

            // default 600 ms ,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildCheckbox(BuildContext context) {
    return Selector<PackerLocationSetProvider, bool?>(
      selector: (BuildContext context, PackerLocationSetProvider provider) =>
          provider.checkbox,
      builder: (BuildContext context, bool? checkbox, Widget? child) {
        return CustomCheckboxButton(
          text: "msg_i_m_flexible_on".tr,
          value: checkbox,
          onChange: (bool value) {
            provider.changeCheckBox1(value);
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildProcess(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "lbl_how_it_worlks".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 22.v),
          Padding(
            padding: EdgeInsets.only(right: 79.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                    children: <Widget>[
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
              children: <Widget>[
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
                    children: <Widget>[
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
            children: <Widget>[
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
                  children: <Widget>[
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
              children: <Widget>[
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
                    children: <Widget>[
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
    );
  }
}
