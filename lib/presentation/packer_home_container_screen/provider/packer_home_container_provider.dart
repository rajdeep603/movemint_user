import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/packer_home_container_model.dart';

/// A provider class for the PackerHomeContainerScreen.
///
/// This provider manages the state of the PackerHomeContainerScreen, including the
/// current packerHomeContainerModelObj

// ignore_for_file: must_be_immutable
class PackerHomeContainerProvider extends ChangeNotifier {
  PackerHomeContainerModel packerHomeContainerModelObj =
      PackerHomeContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
