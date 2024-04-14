import 'package:flutter/material.dart';
import '../models/edit_profile_model.dart';

/// A provider class for the EditProfileScreen.
///
/// This provider manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class EditProfileProvider extends ChangeNotifier {
  EditProfileModel editProfileModelObj = EditProfileModel();

  @override
  void dispose() {
    super.dispose();
  }
}
