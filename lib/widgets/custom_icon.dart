import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.icon, {
    this.color,
    this.size,
    this.onTap,
    this.onClickArea,
    super.key,
  });

  final IconData icon;
  final Color? color;
  final double? size;
  final void Function()? onTap;
  final double? onClickArea;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(
        onTap: () => onTap!.call(),
        child: Padding(
          padding: EdgeInsets.all(onClickArea ?? 0),
          child: Icon(icon, color: color, size: size ?? 24.h),
        ),
      );
    }
    return Icon(icon, color: color, size: size ?? 24.h);
  }
}
