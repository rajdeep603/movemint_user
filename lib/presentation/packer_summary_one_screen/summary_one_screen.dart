import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class SummaryOne extends StatefulWidget {
  const SummaryOne({super.key});

  @override
  State<SummaryOne> createState() => _SummaryOneState();
}

class _SummaryOneState extends State<SummaryOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
        text: "lbl_summary".tr,
      ),
      styleType: Style.bgFill,
    );
  }
}
