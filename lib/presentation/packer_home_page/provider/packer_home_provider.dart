import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_home_model.dart';

/// A provider class for the PackerHomePage.
///
/// This provider manages the state of the PackerHomePage, including the
/// current packerHomeModelObj
class PackerHomeProvider extends ChangeNotifier {
  PackerHomeModel packerHomeModelObj = PackerHomeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
