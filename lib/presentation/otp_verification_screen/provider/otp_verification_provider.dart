import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/toast_helper.dart';
import '../models/otp_verification_model.dart';

class OtpVerificationProvider extends ChangeNotifier {
  OtpVerificationProvider(this.routeModel, this._screenContext);

  OtpVerificationRouteModel routeModel;

  final BuildContext _screenContext;

  bool isLoading = false;

  TextEditingController otpController = TextEditingController();

  Future<void> onVerifyClickEvent() async {
    isLoading = true;
    notifyListeners();
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: routeModel.verificationId,
          smsCode: otpController.text.trim());
      final UserCredential value =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (value.user?.uid == null) {
        ToastHelper.somethingWentWrong();
        return;
      }
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.userDetailsScreen);
    } on Exception catch (e) {
      Logger.logError(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    if (hasListeners) {
      if (_screenContext.mounted) {
        super.notifyListeners();
      }
    }
  }
}
