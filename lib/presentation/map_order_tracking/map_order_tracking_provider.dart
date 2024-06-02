import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/utils/logger.dart';
import '../../domain/models/firebase_models/order_tracking_fcm_model.dart';
import '../../domain/services/firestore_services.dart';
import '../../domain/services/location_services.dart';

class MapOrderTrackingProvider extends ChangeNotifier {
  MapOrderTrackingProvider(this.orderId);
  StreamSubscription<OrderTrackingFcmModel?>? _subscription;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  LatLng? destinationLocation;
  LatLng? driverLocation;

  List<LatLng> polylineCoordinates = <LatLng>[];
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  String? orderId;

  String? displayError;
  bool isLoading = false;

  Future<void> initState({
    required double? destinationLatitude,
    required double? destinationLongitude,
  }) async {
    try {
      isLoading = true;
      final bool permission = await isPermissionGiven();
      if (permission == false) {
        displayError = 'Please enable location permission';
        return;
      }
      displayError = null;
      if (destinationLatitude == null || destinationLongitude == null) {
        displayError = 'Address not available';
        return;
      }
      displayError = null;
      destinationLocation = LatLng(destinationLatitude, destinationLongitude);
      _createOrderStream();
    } on Exception catch (e) {
      Logger.log(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> isPermissionGiven() async {
    final LocationPermission permission =
        await LocationServices.getPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      return false;
    }
    return true;
  }

  void _createOrderStream() {
    if (orderId == null) {
      displayError = 'Order Not available';
      return;
    }
    _subscription = FireStoreServices()
        .getOrderTrackingStream(orderId!)
        ?.listen((OrderTrackingFcmModel? model) {
      if (model == null) {
        displayError = 'Order Not available';
        notifyListeners();
      } else {
        driverLocation = LatLng(model.latitude!, model.longitude!);
        displayError = null;
        getPolyPoints();
        // setCustomMarkerIcon();
      }
    });
  }

  Future<void> getPolyPoints() async {
    final String googleKey = dotenv.get('GOOGLE_API_KEY');
    final PolylinePoints polylinePoints = PolylinePoints();
    final PolylineResult result =
        await polylinePoints.getRouteBetweenCoordinates(
      googleKey, // Your Google Map Key
      PointLatLng(
          destinationLocation!.latitude, destinationLocation!.longitude),
      PointLatLng(driverLocation!.latitude, driverLocation!.longitude),
    );
    if (result.points.isNotEmpty) {
      for (final PointLatLng point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      notifyListeners();
    }
  }

// void setCustomMarkerIcon() {
//   BitmapDescriptor.fromAssetImage(
//           ImageConfiguration.empty, 'assets/Pin_source.png')
//       .then(
//     (BitmapDescriptor icon) {
//       sourceIcon = icon;
//     },
//   );
//   BitmapDescriptor.fromAssetImage(
//           ImageConfiguration.empty, 'assets/Pin_destination.png')
//       .then(
//     (BitmapDescriptor icon) {
//       destinationIcon = icon;
//     },
//   );
//   BitmapDescriptor.fromAssetImage(
//           ImageConfiguration.empty, 'assets/Badge.png')
//       .then(
//     (BitmapDescriptor icon) {
//       currentLocationIcon = icon;
//     },
//   );
// }
}
