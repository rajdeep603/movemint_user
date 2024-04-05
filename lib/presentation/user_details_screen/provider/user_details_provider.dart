import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/user_details_model.dart';

class UserDetailsProvider extends ChangeNotifier {
  UserDetailsProvider(this._screenContext);

  final BuildContext _screenContext;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> onSubmitButtonClicked() async {
    if (formKey.currentState?.validate() ?? false) {
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.packerHomePage);
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
