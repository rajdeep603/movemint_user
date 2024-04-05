import 'package:firebase_auth/firebase_auth.dart';
import 'package:movemint_user/widgets/custom_phone_number.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:movemint_user/widgets/custom_elevated_button.dart';
import '../otp_verification_screen/otp_verification_screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:movemint_user/core/app_export.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: LoginScreen(),
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        // resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                // SizedBox(height: 158.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 120.v),
                        _buildTwentyThree(context),
                        SizedBox(height: 88.v),
                        _buildThree(context),
                        SizedBox(height: 50.v),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyThree(BuildContext context) {
    return SizedBox(
      height: 288.v,
      width: 358.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(right: 2.h),
              padding: EdgeInsets.symmetric(
                horizontal: 9.h,
                vertical: 12.v,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgGroup4,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 251.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgLtPathGt,
                    height: 13.v,
                    width: 337.h,
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFrameOnprimary,
            height: 211.v,
            width: 358.h,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 17.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThree(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      // height: height / 1,
      padding: EdgeInsets.symmetric(
        horizontal: 28.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 23.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                "lbl_welcome".tr,
                style: theme.textTheme.displayMedium,
              ),
            ),
          ),
          SizedBox(height: 11.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Text(
                "lbl_phone_number".tr,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              right: 2.h,
            ),
            child: Consumer<LoginProvider>(
              builder: (context, provider, child) {
                return CustomPhoneNumber(
                  country: provider.selectedCountry ??
                      CountryPickerUtils.getCountryByPhoneCode('91'),
                  controller: provider.phoneNumberController,
                  onTap: (Country value) {
                    context.read<LoginProvider>().changeCountry(value);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 33.v),
          CustomElevatedButton(
            onPressed: () async {
              print("182 working");
              LoginProvider loginProvider =
                  Provider.of<LoginProvider>(context, listen: false);
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpVerificationScreen(
                                  verificationId: verificationId,
                                )));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  phoneNumber:
                      loginProvider.phoneNumberController.text.toString());
            },
            text: "lbl_get_otp".tr,
          ),
          SizedBox(height: 200.v),
        ],
      ),
    );
  }
}
