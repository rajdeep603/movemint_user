import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';

import '../core/utils/validation_functions.dart';
import '../theme/theme_helper.dart';
import 'custom_text_form_field.dart';

class UserDetailsTextFieldContainer extends StatelessWidget {
  const UserDetailsTextFieldContainer({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: CustomTextFormField(
          borderDecoration: InputBorder.none,
          obscureText: obscureText,
          controller: controller,
          hintText: hintText,
          // validator: (String? value) {
          //   if (!isText(value)) {
          //     return "err_msg_please_enter_valid_text".tr;
          //   }
          //   return null;
          // },
        ),
      ),
    );
  }
}
