import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../core/utils/toast_helper.dart';
import '../models/create_order_request_model.dart';
import '../models/get_item_data_response_model.dart';
import '../services/api_services.dart';
import '../services/common_api_call.dart';

class CreateOrderProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  String pickupLat = '';
  String pickupLng = '';
  String dropLocationLat = '';
  String dropLocationLng = '';
  // String city = '';
  // String totalPrice = '';
  bool isLoading = false;

  double totalPrice = 0;

  double totalDistance = 0.0;
  double totalDistancePrice = 0.0;

  // double totalDistancePrice = 0.0;

  List<ProductDetail> productDetail = <ProductDetail>[];

  TextEditingController pickUpLocationController = TextEditingController();
  TextEditingController dropLocationController = TextEditingController();
  TextEditingController searchCityController = TextEditingController();

  // double distance = calculateDistance(lat1, lon1, lat2, lon2);
  // print('Distance: $distance km');

  calculateDistance() {
    var lat1 = double.parse(pickupLat);
    var lon1 = double.parse(pickupLng);
    var lat2 = double.parse(dropLocationLat);
    var lon2 = double.parse(dropLocationLng);

    const R = 6371; // Radius of the Earth in km
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    totalDistance = R * c;
    totalDistancePrice = totalDistance * totalPrice; // Distance in km

    print("60 check distance $dLat");
    print("61 check distance $dLon");
    print("62 check distance $a");
    print("63 check distance $c");
    print("64 check distance ${R * c}");
    print("65 check distance ${totalDistance.toStringAsFixed(2)}");

    return totalDistancePrice;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  // totalDistancePrice = totalDistance * totalPrice;

  List<ProductDetail> list = <ProductDetail>[
    ProductDetail(
        categoryId: '66974cc75d10219433af3ca3',
        subcategoryId: '66974d2e5d10219433af3ca5',
        categoryName: 'Living room',
        items: [
          // DataItem(name: 'Chair', qty: 1),
          // ItemModel(name: 'Table', qty: 1),
          // ItemModel(name: 'Sofa', qty: 0),
        ],
        doesItemsHaveQty: false),
    // ProductDetail(
    //     categoryId: '669bb5013ae7b4d51b1f4338',
    //     subCategoryId: '669ea093d299141c2358267f',
    //     name: 'Bedroom Room',
    //     items: [
    //       ItemModel(name: 'Chair', qty: 1),
    //       ItemModel(name: 'Table', qty: 0),
    //       ItemModel(name: 'Sofa', qty: 0),
    //     ],
    //     doesItemsHaveQty: false),
  ];

  Future<bool> createOrder(List<GetItemDataList> dataList) async {
    try {
      final List<ProductDetail> productDataList = [];

      for (GetItemDataList i in dataList) {
        for (DatumItem j in i.items ?? []) {
          ProductDetail subCatItem = ProductDetail();
          subCatItem.categoryId = i.categoryId;
          subCatItem.categoryName = i.categoryName;
          if (j.items?.any((qty) => (qty.qty ?? 0) > 0) ?? false) {
            subCatItem.subcategoryId = j.subcategoryId;
            subCatItem.items = [];
            for (ItemItem k in j.items ?? []) {
              if ((k.qty ?? 0) > 0) {
                ItemData itemData = ItemData(
                    id: k.id,
                    name: k.name,
                    pricePerKm: k.pricePerKm,
                    qty: k.qty);
                subCatItem.items?.add(itemData);
              }
            }
          }
          if (subCatItem.items?.isNotEmpty ?? false) {
            productDataList.add(subCatItem);
          }
        }
      }
      isLoading = true;
      // final List<ProductDetail> productList =
      //     List<ProductDetail>.from(productDetail);
      // productList.removeWhere(
      //     (ProductDetail element) => element.doesItemsHaveQty == false);
      // productList.forEach((ProductDetail element) {
      //   element.items?.removeWhere((DataItem element) => element == 0);
      // });
      final CreateOrderRequestModel createOrderModel = CreateOrderRequestModel(
        datetime: selectedDate,
        from: pickUpLocationController.text,
        to: dropLocationController.text,
        city: searchCityController.text.isEmpty
            ? 'NA'
            : searchCityController.text,
        data: productDataList,
        total: calculateDistance().toString(),
        pickLat: pickupLat,
        pickLng: pickupLng,
        dropLat: dropLocationLat,
        dropLng: dropLocationLng,
      );
      print("check model 149 ${totalDistance}");
      print("check model 146 ${calculateDistance()}");
      print("check model50 ${createOrderModel.data?.length ?? 0}");
      print("check model 144 ${createOrderModel.total}");
      print("check model 145 ${totalDistance}");
      print("check model 146 ${pickupLat}and ${pickupLng}");
      print("check model 147 ${dropLocationLat}and ${dropLocationLng}");
      print("check model 148 ${totalPrice}");
      print("check model 148 ${totalPrice}");
      // print("check model 146 ${calculateDistance()}");
      // print("check model ${createOrderModel.pickLat}");
      // print(
      //     "52 check model data ${createOrderModel.productDetail.first.items}");

      final CustomResponse customResponse =
          await ApiServices().createOrder(createOrderModel);
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return false;
      }
      print("168 check dataResponse: ${customResponse.response?.data}");
      ToastHelper.showToast('Order Created Successfully');
      isLoading = false;
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboard);
      return true;
    } on Exception catch (e) {
      Logger.logError(e);
      ToastHelper.somethingWentWrong();
      return false;
    }
  }

  void disposeValues() {
    selectedDate = DateTime.now();
    pickUpLocationController.clear();
    dropLocationController.clear();
    searchCityController.clear();
    totalPrice = 0.0;
    totalDistancePrice = 0.0;
    totalDistance = 0;
    productDetail = <ProductDetail>[];
  }

  @override
  void notifyListeners() {
    if (hasListeners) {
      if (NavigatorService.navigatorKey.currentState?.mounted ?? false) {
        super.notifyListeners();
      }
    }
  }
}
