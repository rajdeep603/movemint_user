import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/toast_helper.dart';
import '../../../domain/local_storage/local_storage.dart';
import '../../../domain/models/sign_in_model/sign_in_request_model.dart';
import '../../../domain/models/sign_in_model/sign_in_response_model.dart';
import '../../../domain/providers/user_provider.dart';
import '../../../domain/services/api_services.dart';
import '../../../domain/services/common_api_call.dart';
import '../../register_screen/models/register_screen_route_model.dart';
import '../models/otp_verification_model.dart';

class OtpVerificationProvider extends ChangeNotifier {
  OtpVerificationProvider(this.routeModel, this._screenContext) {
    _startTimer();
  }

  OtpVerificationRouteModel routeModel;

  final BuildContext _screenContext;

  bool isLoading = false;

  Timer? timer;

  int startTime = 60;

  TextEditingController otpController = TextEditingController();

  void _startTimer() {
    startTime = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (startTime == 0) {
        timer.cancel();
        return;
      }
      startTime--;
      notifyListeners();
    });
  }

  Future<void> onReSendClickEvent() async {
    _startTimer();
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
            routeModel.verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          phoneNumber: '+91 ${routeModel.mobileNo}');
    } on Exception catch (e) {
      Logger.logError(e);
    }
  }

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
      await _checkMobileNoExitsAndNavigate();
    } on Exception catch (e) {
      ToastHelper.showToast(e.toString());
      Logger.logError(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _checkMobileNoExitsAndNavigate() async {
    try {
      final CustomResponse customResponse =
          await ApiServices().checkUserExists(routeModel.mobileNo);
      if (customResponse.statusCode == 404) {
        final RegisterScreenRouteModel registerScreenRouteModel =
            RegisterScreenRouteModel(
                // selectedCountry: routeModel.selectedCountry,
                mobileNo: routeModel.mobileNo,
                verificationId: routeModel.verificationId);
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.registerScreen,
            arguments: registerScreenRouteModel);
        return;
      }
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return;
      }
      await _signInUser();
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
    }
  }

  Future<void> _signInUser() async {
    try {
      final SignInRequestModel signInModel =
          SignInRequestModel(phoneNo: routeModel.mobileNo, role: 'user');
      final CustomResponse customResponse =
          await ApiServices().signIn(signInModel);
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return;
      }
      final SignInResponseModel signInResponseModel =
          SignInResponseModel.fromMap(customResponse.response?.data);
      _screenContext.read<UserProvider>().userModel = signInResponseModel;
      LocalStorage.saveMobileNo(routeModel.mobileNo);
      LocalStorage.saveToken(signInResponseModel.data?.userToken ?? '');
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboard);
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
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
