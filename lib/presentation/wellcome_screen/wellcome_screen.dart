import 'models/wellcome_model.dart';
import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';
import 'provider/wellcome_provider.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  WellcomeScreenState createState() => WellcomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WellcomeProvider(), child: WellcomeScreen());
  }
}

class WellcomeScreenState extends State<WellcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.onboardingScreenOneScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: 429.h,
                padding: EdgeInsets.symmetric(horizontal: 52.h, vertical: 11.v),
                child: Column(children: [
                  Spacer(flex: 42),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup1171281249,
                      height: 80.v,
                      width: 152.h),
                  SizedBox(height: 31.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup,
                      height: 41.v,
                      width: 325.h),
                  Spacer(flex: 57),
                  SizedBox(
                      width: 127.h, child: Divider(color: appTheme.whiteA700))
                ]))));
  }
}
