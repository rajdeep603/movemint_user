import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/toast_helper.dart';
import '../../otp_verification_screen/models/otp_verification_model.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;

  // Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> onGetOTPClickEvent() async {
    if (formKey.currentState?.validate() ?? false) {
      if (phoneNumberController.text.trim().length != 10) {
        ToastHelper.showToast('Please enter 10 digit mobile no.');
        return;
      }
      try {
        isLoading = true;
        notifyListeners();
              // final OtpVerificationRouteModel routeModel =
              //     OtpVerificationRouteModel(
              //   // selectedCountry: selectedCountry,
              //   mobileNo: phoneNumberController.text.trim(),
              //   verificationId: '000000',
              // );
              // NavigatorService.pushNamed(AppRoutes.otpVerificationScreen,
              //     arguments: routeModel);
        await FirebaseAuth.instance.verifyPhoneNumber(
            verificationCompleted: (PhoneAuthCredential credential) {
              isLoading = false;
              notifyListeners();
            },
            verificationFailed: (FirebaseAuthException ex) {
              isLoading = false;
              notifyListeners();
            },
            codeSent: (String verificationId, int? resendToken) {
              isLoading = false;
              notifyListeners();
              final OtpVerificationRouteModel routeModel =
                  OtpVerificationRouteModel(
                // selectedCountry: selectedCountry,
                mobileNo: phoneNumberController.text.trim(),
                verificationId: verificationId,
              );
              NavigatorService.pushNamed(AppRoutes.otpVerificationScreen,
                  arguments: routeModel);
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
            phoneNumber:
                '+91 ${phoneNumberController.text.trim()}');
      } on Exception catch (e) {
        Logger.logError(e);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  // void changeCountry(Country value) {
  //   selectedCountry = value;
  //   notifyListeners();
  // }
}
