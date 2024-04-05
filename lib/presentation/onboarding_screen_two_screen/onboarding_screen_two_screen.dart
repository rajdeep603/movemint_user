import 'package:movemint_user/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../login_screen/login_screen.dart';
import '../onboarding_screen_three_screen/onboarding_screen_three_screen.dart';
import 'models/onboarding_screen_two_model.dart';
import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';
import 'provider/onboarding_screen_two_provider.dart';

class OnboardingScreenTwoScreen extends StatefulWidget {
  const OnboardingScreenTwoScreen({super.key});

  @override
  OnboardingScreenTwoScreenState createState() =>
      OnboardingScreenTwoScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<OnboardingScreenTwoProvider>(
      create: (BuildContext context) => OnboardingScreenTwoProvider(),
      child: const OnboardingScreenTwoScreen(),
    );
  }
}

class OnboardingScreenTwoScreenState extends State<OnboardingScreenTwoScreen> {
  late OnboardingScreenTwoProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OnboardingScreenTwoProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: <Widget>[
              // SizedBox(height: 173.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50.v),
                      Container(
                        height: 303.v,
                        width: 296.h,
                        margin: EdgeInsets.only(left: 56.h),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            CustomImageView(
                              imagePath: ImageConstant.imgFrame,
                              height: 239.v,
                              width: 296.h,
                              alignment: Alignment.topCenter,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgObject,
                              height: 270.v,
                              width: 214.h,
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(right: 30.h),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 90.v),
                      _buildTwo(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 34.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 12.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Text(
                "lbl_delivery".tr,
                style: theme.textTheme.displayMedium,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 296.h,
              margin: EdgeInsets.only(
                left: 11.h,
                right: 64.h,
              ),
              child: Text(
                "msg_fast_convenient".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumGray700.copyWith(
                  height: 1.63,
                ),
              ),
            ),
          ),
          SizedBox(height: 48.v),
          CustomElevatedButton(
            onPressed: () => provider.onNextClickEvent(),
            text: "lbl_next".tr,
          ),
          SizedBox(height: 32.v),
          InkWell(
            onTap: () => provider.onSkipClickEvent(),
            child: Text(
              "lbl_skip".tr,
              style: CustomTextStyles.titleMediumGreen900,
            ),
          ),
          SizedBox(height: 60.v),
          SizedBox(
            height: 9.v,
            child: AnimatedSmoothIndicator(
              activeIndex: 1,
              count: 3,
              effect: ScrollingDotsEffect(
                spacing: 10,
                activeDotColor: appTheme.lightGreen400,
                dotColor: appTheme.lightGreen4006c,
                dotHeight: 9.v,
                dotWidth: 9.h,
              ),
            ),
          ),
          SizedBox(height: 31.v),
        ],
      ),
    );
  }
}
