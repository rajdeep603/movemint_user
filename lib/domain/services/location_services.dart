import 'dart:async';

import 'package:geolocator/geolocator.dart';

import '../../core/app_export.dart';
import '../../core/utils/toast_helper.dart';

class LocationServices {
  static late StreamSubscription<ServiceStatus> serviceStatusStream;

  static Future<bool> enableService() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ToastHelper.showToast('Please enable location');
    }
    return serviceEnabled;
  }

  static Future<void> enableServiceStream() async {
    serviceStatusStream = Geolocator.getServiceStatusStream()
        .listen((ServiceStatus status) async {
      if (status == ServiceStatus.disabled) {
        ToastHelper.showToast(
            'Please Enable location services for better experience');
      }
    });
  }

  static Future<LocationPermission> getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    Logger.log('permissionGranted:$permission');
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      ToastHelper.showToast('Please enable location permission');
    }
    return permission;
  }

  /// Services and permission also checked here. If services and permission is disabled then position will be null.
  static Future<Position?> getCurrentPosition() async {
    Position? positionData;
    final bool isServiceEnabled = await enableService();
    if (isServiceEnabled) {
      final LocationPermission permission = await getPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        positionData = await Geolocator.getCurrentPosition();
      }
    }
    return positionData;
  }

  static void dispose() {
    serviceStatusStream.cancel();
  }
}
