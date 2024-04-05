import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/otp_verification_model.dart';

/// A provider class for the OtpVerificationScreen.
///
/// This provider manages the state of the OtpVerificationScreen, including the
/// current otpVerificationModelObj
class OtpVerificationProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();

  OtpVerificationModel otpVerificationModelObj = OtpVerificationModel();

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
