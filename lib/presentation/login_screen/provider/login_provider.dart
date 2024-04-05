import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../otp_verification_screen/models/otp_verification_model.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');

  Future<void> onGetOTPClickEvent() async {
    try {
      isLoading = true;
      notifyListeners();
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
              selectedCountry: selectedCountry,
              mobileNo: phoneNumberController.text.trim(),
              verificationId: verificationId,
            );
            NavigatorService.pushNamed(AppRoutes.otpVerificationScreen,
                arguments: routeModel);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             OtpVerificationScreen(
            //               verificationId: verificationId,
            //             )));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          phoneNumber:
              '+${selectedCountry.phoneCode} ${phoneNumberController.text.trim()}');
    } on Exception catch (e) {
      Logger.logError(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  void changeCountry(Country value) {
    selectedCountry = value;
    notifyListeners();
  }
}
