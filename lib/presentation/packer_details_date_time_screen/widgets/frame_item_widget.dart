import 'package:movemint_user/core/app_export.dart';

import '../../../theme/theme_helper.dart';
import '../models/frame_item_model.dart';
import 'package:flutter/material.dart';

import '../provider/packer_details_date_time_provider.dart';

class FrameItemWidget extends StatelessWidget {
  FrameItemWidget(
    this.date, {
    super.key,
    this.onSelectedChipView1,
  });

  DateTimeListModel date;

  Function(bool)? onSelectedChipView1;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
      showCheckmark: false,
      label: Text(
        date.date.format(DateTimeUtils.dMonFormat),
        style: TextStyle(
          color:
              (date.isSelected) ? theme.colorScheme.primary : appTheme.gray700,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: date.isSelected,
      backgroundColor: appTheme.gray10001,
      selectedColor: appTheme.gray10001,
      shape: (date.isSelected)
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
      onSelected: (bool value) {
        onSelectedChipView1?.call(value);
      },
    );
  }
}
