import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movemint_user/widgets/custom_pin_code_text_field.dart';
import 'package:movemint_user/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../user_details_screen/user_details_screen.dart';
import 'models/otp_verification_model.dart';
import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';
import 'provider/otp_verification_provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  String verificationId;
  OtpVerificationScreen({super.key, required this.verificationId});

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
  // static Widget builder(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context) => OtpVerificationProvider(),
  //     child: OtpVerificationScreen(),
  //   );
  // }
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 12.v),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.v),
                Text(
                  "msg_otp_verification".tr,
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 12.v),
                Container(
                  width: 325.h,
                  margin: EdgeInsets.only(
                    left: 51.h,
                    right: 53.h,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_we_will_send_you2".tr,
                          style: CustomTextStyles.bodyLargeInterff000000,
                        ),
                        TextSpan(
                          text: "lbl_mobile_number".tr,
                          style: CustomTextStyles.titleMediumff000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.v),
                Text(
                  "msg_91_00000000000".tr,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 18.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 84.h,
                    right: 85.h,
                  ),
                  child:
                      Selector<OtpVerificationProvider, TextEditingController?>(
                    selector: (
                      context,
                      provider,
                    ) =>
                        provider.otpController,
                    builder: (context, otpController, child) {
                      return CustomPinCodeTextField(
                        context: context,
                        controller: otpController,
                        onChanged: (value) {
                          otpController?.text = value;
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  "lbl_00_30".tr,
                  style: CustomTextStyles.bodyMediumGray70001,
                ),
                SizedBox(height: 15.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Text(
                        "msg_do_not_send_otp".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          "lbl_send_otp".tr,
                          style: CustomTextStyles.titleSmallGreenA70075,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.v),
                _buildEighteen(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return SizedBox(
      height: 452.v,
      width: 427.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFrameGray200,
            height: 346.v,
            width: 427.h,
            alignment: Alignment.topCenter,
          ),
          SizedBox(
            height: 15.v,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 30.h,
                right: 25.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                    onPressed: () async {
                      OtpVerificationProvider otpProvider =
                          Provider.of<OtpVerificationProvider>(context,
                              listen: false);
                      try {
                        PhoneAuthCredential credential =
                            await PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode:
                                    otpProvider.otpController.text.toString());
                        FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen()));
                        });
                      } catch (ex) {
                        // log(ex.toString());
                        print(ex.toString());
                      }
                    },
                    text: "lbl_verify".tr,
                  ),
                  SizedBox(height: 70.v),
                  // SizedBox(
                  //   height: 9.v,
                  //   child: AnimatedSmoothIndicator(
                  //     activeIndex: 0,
                  //     count: 3,
                  //     effect: ScrollingDotsEffect(
                  //       spacing: 10,
                  //       activeDotColor: appTheme.lightGreen400,
                  //       dotColor: appTheme.lightGreen4006c,
                  //       dotHeight: 9.v,
                  //       dotWidth: 9.h,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
