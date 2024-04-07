import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/toast_helper.dart';
import '../../../domain/models/create_order_request_model.dart';
import '../../../domain/providers/create_order_provider.dart';
import '../../../domain/services/common_api_call.dart';
import '../models/packer_additems_two_tab_container_model.dart';

class PackerAdditemsProvider extends ChangeNotifier {
  PackerAdditemsTwoTabContainerModel packerAdditemsTwoTabContainerModelObj =
      PackerAdditemsTwoTabContainerModel();

  List<ProductDetailModel> productListModel = <ProductDetailModel>[];
  bool isLoading = false;

  Future<void> onNextClickEvent(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      final bool value = await context.read<CreateOrderProvider>().createOrder();
      if (value) {
        context.read<CreateOrderProvider>().disposeValues();
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboard);
      }
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
    } finally {
      isLoading = true;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
