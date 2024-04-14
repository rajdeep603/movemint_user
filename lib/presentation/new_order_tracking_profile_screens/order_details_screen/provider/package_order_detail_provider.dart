import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../../core/utils/toast_helper.dart';
import '../../../../domain/services/api_services.dart';
import '../../../../domain/services/common_api_call.dart';
import '../models/package_order_detail_route_model.dart';
import '../models/packer_summary_one_model.dart';

class PackageOrderDetailProvider extends ChangeNotifier {
  PackageOrderDetailProvider(this.routeModel);

  PackageOrderDetailRouteModel routeModel;
  TextEditingController timeController = TextEditingController();

  PackerSummaryOneModel packerSummaryOneModelObj = PackerSummaryOneModel();

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in packerSummaryOneModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected1(dynamic value) {
    for (var element in packerSummaryOneModelObj.dropdownItemList1) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  Future<void> cancelOrder() async {
    Logger.log('cancelOrder');
    try {
      final CustomResponse customResponse =
          await ApiServices().cancelOrder(routeModel.orderId);
      if (customResponse.response == null || customResponse.statusCode != 200) {
        ToastHelper.showToast(customResponse.error);
        return;
      }
      ToastHelper.showToast('Order Cancelled');
      NavigatorService.popUntil(AppRoutes.dashboard);
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
    }
  }
}
