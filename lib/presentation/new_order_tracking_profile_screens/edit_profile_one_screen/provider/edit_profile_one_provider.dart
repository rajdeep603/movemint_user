import 'package:flutter/material.dart';
import '../models/edit_profile_one_model.dart';

/// A provider class for the EditProfileOneScreen.
///
/// This provider manages the state of the EditProfileOneScreen, including the
/// current editProfileOneModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class EditProfileOneProvider extends ChangeNotifier {
  EditProfileOneModel editProfileOneModelObj = EditProfileOneModel();

  @override
  void dispose() {
    super.dispose();
  }
}
