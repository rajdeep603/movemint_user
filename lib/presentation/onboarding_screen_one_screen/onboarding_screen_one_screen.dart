import 'package:movemint_user/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../onboarding_screen_two_screen/onboarding_screen_two_screen.dart';
import 'models/onboarding_screen_one_model.dart';
import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';
import 'provider/onboarding_screen_one_provider.dart';

class OnboardingScreenOneScreen extends StatefulWidget {
  const OnboardingScreenOneScreen({super.key});

  @override
  OnboardingScreenOneScreenState createState() =>
      OnboardingScreenOneScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<OnboardingScreenOneProvider>(
      create: (BuildContext context) => OnboardingScreenOneProvider(),
      child: OnboardingScreenOneScreen(),
    );
  }
}

class OnboardingScreenOneScreenState extends State<OnboardingScreenOneScreen> {
  @override
  void initState() {
    super.initState();
  }

  late OnboardingScreenOneProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OnboardingScreenOneProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // SizedBox(height: 100.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 70.v),
                      Container(
                        height: 303.v,
                        width: 296.h,
                        // margin: EdgeInsets.only(left: 56.h),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFrame,
                              height: 239.v,
                              width: 296.h,
                              alignment: Alignment.topCenter,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgObjectPurple900,
                              height: 300.v,
                              width: 300.h,
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 58.v),
                      _buildOne(context),
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
  Widget _buildOne(BuildContext context) {
    return Container(
      // height: height / 1,
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 34.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
              activeIndex: 0,
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
