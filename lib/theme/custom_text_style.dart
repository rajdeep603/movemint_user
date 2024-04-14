import 'package:flutter/material.dart';
import 'package:movemint_user/core/utils/size_utils.dart';
import 'package:movemint_user/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargeInterGray500 => theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray500,
        fontSize: 16.fSize,
      );
  static TextStyle get bodyLargeInterff000000 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: Color(0XFF000000),
      );
  static TextStyle get bodyMediumGray70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray70001,
      );
  static TextStyle get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static TextStyle get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get bodyMediumff01a367 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF01A367),
      );
  static TextStyle get bodySmallErrorContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static TextStyle get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static TextStyle get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
  static TextStyle get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodySmallGray800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w400,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeGreenA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.greenA700,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumPoppinsGray900 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumff47286f => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF47286F),
      );
  static TextStyle get titleMediumff47286fSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF47286F),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get titleSmallBlack900Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeTeal60012 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal600,
        fontSize: 12.fSize,
      );

  static TextStyle get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 14.fSize,
      );
  static TextStyle get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static TextStyle get labelLargeTeal600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal600,
      );
  static TextStyle get titleSmallGray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90001,
      );
  static TextStyle get bodySmallGray10002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray10002,
        fontSize: 12.fSize,
      );
  static TextStyle get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
      );
  static TextStyle get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  // Label text style
  static TextStyle get labelLargeGray300 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray300,
      );
  static TextStyle get labelLargeGray50 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50,
      );
  static TextStyle get labelLargeGray600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelLargeOnErrorContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static TextStyle get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static TextStyle get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
      );

  // Title text style
  static TextStyle get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumGreen900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green900,
      );
  static TextStyle get titleMediumff000000 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallGreenA70075 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.greenA70075,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumGray900SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumRalewayWhiteA700 =>
      theme.textTheme.titleMedium!.raleway.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumInterGray600 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterff000000 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterff71727a =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: Color(0XFF71727A),
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumSFProDisplayOnPrimary =>
      theme.textTheme.titleMedium!.sFProDisplay.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
      );
  static TextStyle get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmall_1 => theme.textTheme.titleSmall!;
  static TextStyle get titleSmallff1f2024 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF1F2024),
      );
  static TextStyle get titleSmallff1f2024_1 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF1F2024),
      );
  static TextStyle get titleSmallGray90001Bold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumGray600SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static TextStyle get labelLargeGreenA70001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.greenA70001,
        fontWeight: FontWeight.w500,
      );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 14.fSize,
      );

  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallGray900_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
      );
// Label text style

  static get labelLargeGray900SemiBold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static get labelLargeTeal600_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal600,
      );
// Title text style

  static get titleMediumRaleway =>
      theme.textTheme.titleMedium!.raleway.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static get titleSmallGray900SemiBold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray900_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
      );
  static get titleSmallRedA400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.redA400,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }

  TextStyle get outfit {
    return copyWith(
      fontFamily: 'Outfit',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
