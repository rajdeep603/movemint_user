import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/utils/toast_helper.dart';
import '../../domain/models/get_orders_model.dart';
import '../../domain/services/api_services.dart';
import '../../domain/services/common_api_call.dart';

class OrderListProvider extends ChangeNotifier {
  OrderListProvider(this.screenContext) {
    getOrdersData();
  }

  bool isLoading = false;
  BuildContext screenContext;
  GetOrdersModel? getOrderModel;

  Future<void> getOrdersData() async {
    try {
      isLoading = true;
      notifyListeners();
      final CustomResponse customResponse =
          await ApiServices().getOrders();
      if (customResponse.response == null || customResponse.statusCode != 200) {
        getOrderModel = null;
        ToastHelper.showToast(customResponse.error);
        return;
      }
      getOrderModel = GetOrdersModel.fromMap(customResponse.response?.data);
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    if (hasListeners) {
      if (screenContext.mounted) {
        super.notifyListeners();
      }
    }
  }
}
