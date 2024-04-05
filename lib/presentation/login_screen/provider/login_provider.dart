import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/login_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';

/// A provider class for the LoginScreen.
///
/// This provider manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();

  LoginModel loginModelObj = LoginModel();

  Country? selectedCountry;

  // @override
  // void dispose() {
  //   super.dispose();
  //   phoneNumberController.dispose();
  // }

  void changeCountry(Country value) {
    selectedCountry = value;
    notifyListeners();
  }
}
