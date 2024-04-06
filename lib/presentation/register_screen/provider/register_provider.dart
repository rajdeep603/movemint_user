import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/toast_helper.dart';
import '../../../domain/models/sign_in_model/sign_in_request_model.dart';
import '../../../domain/models/sign_in_model/sign_in_response_model.dart';
import '../../../domain/models/sign_up_model.dart';
import '../../../domain/services/api_services.dart';
import '../../../domain/services/common_api_call.dart';
import '../models/register_screen_route_model.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider(this._screenContext, this.routeModel);

  final BuildContext _screenContext;

  final RegisterScreenRouteModel routeModel;

  bool isLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> onSubmitButtonClicked() async {
    if (formKey.currentState?.validate() ?? false) {
      _registerUser();
    }
  }

  Future<void> _registerUser() async {
    try {
      isLoading = true;
      notifyListeners();
      final String firstName = firstNameController.text.trim();
      final String lastName = lastNameController.text.trim();
      final SignUpModel signUpModel = SignUpModel(
          firstName: firstName,
          lastname: lastName,
          username: '$firstName $lastName',
          name: '$firstName $lastName',
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          firebaseAuthId: routeModel.verificationId,
          phoneNo: routeModel.mobileNo);

      final CustomResponse customResponse =
          await ApiServices().signUp(signUpModel);
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return;
      }
      await _signInUser();
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _signInUser() async {
    try {
      final SignInModel signInModel =
          SignInModel(phoneNo: routeModel.mobileNo, role: 'user');
      final CustomResponse customResponse =
          await ApiServices().signIn(signInModel);
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return;
      }
      //TODO: save in local storage
      final SignInResponseModel signInResponseModel =
          SignInResponseModel.fromMap(customResponse.response?.data);
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.packerHomePage);
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

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
