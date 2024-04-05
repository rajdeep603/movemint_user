import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(color: color);
    }
    return CircularProgressIndicator(color: color);
  }
}
