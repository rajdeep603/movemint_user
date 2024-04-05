import 'package:movemint_user/core/app_export.dart';

import '../../../theme/theme_helper.dart';
import '../models/frame2_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Frame2ItemWidget extends StatelessWidget {
  Frame2ItemWidget(
    this.frame2ItemModelObj, {
    Key? key,
    this.onSelectedChipView2,
  }) : super(
          key: key,
        );

  Frame2ItemModel frame2ItemModelObj;

  Function(bool)? onSelectedChipView2;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 11.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        frame2ItemModelObj.tag!,
        style: TextStyle(
          color: (frame2ItemModelObj.isSelected ?? false)
              ? theme.colorScheme.primary
              : appTheme.gray700,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: (frame2ItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.gray10001,
      selectedColor: appTheme.gray10001,
      shape: (frame2ItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.primary,
                width: 2.h,
              ),
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView2?.call(value);
      },
    );
  }
}
