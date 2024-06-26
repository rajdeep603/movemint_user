
import 'package:flutter/services.dart';
import 'package:movemint_user/core/utils/validation_functions.dart';
import 'package:movemint_user/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    // required this.country,
    // required this.onTap,
    required this.controller,
  }) : super(
          key: key,
        );

  // Country country;

  // Function(Country) onTap;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(color: appTheme.gray300, width: 1.h),
      ),
      child: CustomTextFormField(
        controller: controller,
        borderDecoration: InputBorder.none,
        hintText: "msg_enter_mobile_number".tr,
        textInputType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly
        ],
        // validator: (value) {
        //   if (!isValidPhone(value)) {
        //     return "err_msg_please_enter_valid_phone_number".tr;
        //   }
        //   return null;
        // },
        contentPadding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.v),
      ),
    );
  }

  // Widget _buildDialogItem(Country country) => Row(
  //       children: <Widget>[
  //         CountryPickerUtils.getDefaultFlagImage(country),
  //         Container(
  //           margin: EdgeInsets.only(
  //             left: 10.h,
  //           ),
  //           width: 60.h,
  //           child: Text(
  //             "+${country.phoneCode}",
  //             style: TextStyle(fontSize: 14.fSize),
  //           ),
  //         ),
  //         const SizedBox(width: 8.0),
  //         Flexible(
  //           child: Text(
  //             country.name,
  //             style: TextStyle(fontSize: 14.fSize),
  //           ),
  //         ),
  //       ],
  //     );

  // void _openCountryPicker(BuildContext context) => showDialog(
  //       context: context,
  //       builder: (context) => CountryPickerDialog(
  //         searchInputDecoration: InputDecoration(
  //           hintText: 'Search...',
  //           hintStyle: TextStyle(fontSize: 14.fSize),
  //         ),
  //         isSearchable: true,
  //         title: Text('Select your phone code',
  //             style: TextStyle(fontSize: 14.fSize)),
  //         onValuePicked: (Country country) => onTap(country),
  //         itemBuilder: _buildDialogItem,
  //       ),
  //     );
}
