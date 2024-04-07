import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../core/utils/toast_helper.dart';
import '../models/create_order_request_model.dart';
import '../services/api_services.dart';
import '../services/common_api_call.dart';

class CreateOrderProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  // String pickupLocation = '';
  // String dropLocation = '';
  // String city = '';
  String totalPrice = '';
  List<ProductDetailModel> productDetail = <ProductDetailModel>[];

  TextEditingController pickUpLocationController = TextEditingController();
  TextEditingController dropLocationController = TextEditingController();
  TextEditingController searchCityController = TextEditingController();

  Future<bool> createOrder() async {
    try {
      final data = [
        ProductDetailModel(
          items: [ItemModel(name: 'chair', qty: 4)],
          name: "Living Room",
        )
      ];

      final CreateOrderModel createOrderModel = CreateOrderModel(
          datetime: selectedDate,
          from: pickUpLocationController.text,
          to: dropLocationController.text,
          city: searchCityController.text,
          // productDetail: productDetail,
          productDetail: data,
          totalPrice: '100');
      final CustomResponse customResponse =
          await ApiServices().createOrder(createOrderModel);
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return false;
      }

      ToastHelper.showToast('Order Created Successfully');
      return true;
    } on Exception catch (e) {
      Logger.logError(e);
      ToastHelper.somethingWentWrong();
      return false;
    }
  }

void disposeValues(){
  selectedDate = DateTime.now();
  pickUpLocationController.clear();
  dropLocationController.clear();
  searchCityController.clear();
  totalPrice = '';
  productDetail = <ProductDetailModel>[];
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
