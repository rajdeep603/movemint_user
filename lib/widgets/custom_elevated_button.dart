import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/app_export.dart';
import 'base_button.dart';
import 'custom_circular_loading.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool isDisabled = false,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 53.v,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled
              ? null
              : isLoading
                  ? () {}
                  : () {
                      HapticFeedback.lightImpact();
                      onPressed?.call();
                    },
          child: isLoading
              ? CustomCircularLoading(color: appTheme.whiteA700)
              : isLoading
                  ? CustomCircularLoading(color: appTheme.whiteA700)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        leftIcon ?? const SizedBox.shrink(),
                        Text(
                          text,
                          style: buttonTextStyle ?? theme.textTheme.titleMedium,
                        ),
                        rightIcon ?? const SizedBox.shrink(),
                      ],
                    ),
        ),
      );
}
