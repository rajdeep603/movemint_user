import 'package:country_pickers/country.dart';

class OtpVerificationRouteModel {
  OtpVerificationRouteModel(
      {required this.selectedCountry,
      required this.mobileNo,
      required this.verificationId});

  final Country selectedCountry;
  final String mobileNo;
   String verificationId;
}
