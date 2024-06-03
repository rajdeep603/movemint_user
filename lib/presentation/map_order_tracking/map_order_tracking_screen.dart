import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/app_export.dart';
import '../../domain/services/location_services.dart';
import '../../widgets/custom_circular_loading.dart';
import 'map_order_tracking_provider.dart';

class MapOrderTrackingScreen extends StatefulWidget {
  const MapOrderTrackingScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<MapOrderTrackingProvider>(
      create: (BuildContext context) => MapOrderTrackingProvider('123'),
      child: const MapOrderTrackingScreen(),
    );
  }

  @override
  State<MapOrderTrackingScreen> createState() => MapOrderTrackingScreenState();
}

class MapOrderTrackingScreenState extends State<MapOrderTrackingScreen> {
  late MapOrderTrackingProvider provider;

  @override
  void initState() {
    context.read<MapOrderTrackingProvider>().initState(
        destinationLatitude: 17.44368, destinationLongitude: 78.3546);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MapOrderTrackingProvider>(context);
    return Scaffold(
      body: _googleMapWidget(),
    );
  }

  Widget _googleMapWidget() {
    return provider.isLoading
        ? const Center(child: CustomCircularLoading())
        : (provider.displayError != null)
            ? Center(child: Text(provider.displayError!,style: CustomTextStyles.titleMediumBlack900,))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(provider.destinationLocation!.latitude,
                      provider.destinationLocation!.longitude),
                  zoom: 13.5,
                ),
                markers: <Marker>{
                  Marker(
                    markerId: const MarkerId('currentLocation'),
                    icon: provider.currentLocationIcon,
                    position: LatLng(provider.destinationLocation!.latitude,
                        provider.destinationLocation!.longitude),
                  ),
                  Marker(
                    markerId: const MarkerId('source'),
                    icon: provider.sourceIcon,
                    position: provider.driverLocation!,
                  ),
                  Marker(
                    markerId: const MarkerId('destination'),
                    icon: provider.destinationIcon,
                    position: provider.driverLocation!,
                  ),
                },
                onMapCreated: (GoogleMapController mapController) {
                  provider.controller.complete(mapController);
                },
                polylines: <Polyline>{
                  Polyline(
                    polylineId: const PolylineId('route'),
                    points: provider.polylineCoordinates,
                    color: const Color(0xFF7B61FF),
                    width: 6,
                  ),
                },
              );
  }
}
