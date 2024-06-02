import '../../widgets/custom_pin_code_text_field.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/otp_verification_model.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'provider/otp_verification_provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static Widget builder(BuildContext context) {
    final OtpVerificationRouteModel routeModel = ModalRoute.of(context)!
        .settings
        .arguments! as OtpVerificationRouteModel;
    return ChangeNotifierProvider<OtpVerificationProvider>(
      create: (BuildContext context) =>
          OtpVerificationProvider(routeModel, context),
      child: const OtpVerificationScreen(),
    );
  }

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  late OtpVerificationProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OtpVerificationProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 12.v),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
                      children: <InlineSpan>[
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
                  '+91 - ${provider.routeModel.mobileNo}',
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 18.v),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.v),
                  child:
                      Selector<OtpVerificationProvider, TextEditingController?>(
                    selector: (BuildContext context,
                            OtpVerificationProvider provider) =>
                        provider.otpController,
                    builder: (BuildContext context,
                        TextEditingController? otpController, Widget? child) {
                      return CustomPinCodeTextField(
                        context: context,
                        controller: otpController,
                        onChanged: (String value) {
                          otpController?.text = value;
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.v),
                _buildResendButton(context),
                SizedBox(height: 30.v),
                _buildEighteen(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendButton(BuildContext context) {
    return Selector<OtpVerificationProvider, int>(
      shouldRebuild: (int previous, int next) {
        if (previous == next) {
          return false;
        }
        return true;
      },
      selector: (BuildContext context, OtpVerificationProvider provider) =>
          provider.startTime,
      builder: (BuildContext context, int startTime, Widget? child) {
        if (startTime == 0) {
          return Center(
            child: InkWell(
              onTap: () =>
                  context.read<OtpVerificationProvider>().onReSendClickEvent(),
              child: Text(
                'Resend OTP ?',
                style: CustomTextStyles.titleMediumBlack900.copyWith(
                  color: appTheme.greenA70075,
                ),
              ),
            ),
          );
        }
        return Text(
          '${startTime.toString().padLeft(2, '0')} sec',
          style: CustomTextStyles.bodyMediumGray70001,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return SizedBox(
      height: 452.v,
      width: 427.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
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
                children: <Widget>[
                  CustomElevatedButton(
                    isLoading: provider.isLoading,
                    onPressed: () => provider.onVerifyClickEvent(),
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
