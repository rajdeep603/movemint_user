import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/toast_helper.dart';
import '../../../domain/models/create_order_request_model.dart';
import '../../../domain/providers/create_order_provider.dart';
import '../../../domain/services/common_api_call.dart';
import '../models/packer_additems_two_tab_container_model.dart';

class PackerAddItemsProvider extends ChangeNotifier {
  PackerAddItemsProvider(this.screenContext) {
    screenContext.read<CreateOrderProvider>().productDetail = List.from(list);
  }
  BuildContext screenContext;

  // List<ProductDetailModel> productListModel = <ProductDetailModel>[];
  bool isLoading = false;

  Future<void> onNextClickEvent(BuildContext context) async {
    if (screenContext.read<CreateOrderProvider>().productDetail.any((ProductDetailModel element) => element.doesItemsHaveQty)) {
      try {
        isLoading = true;
        notifyListeners();
        final bool value =
            await context.read<CreateOrderProvider>().createOrder();
        if (value) {
          context.read<CreateOrderProvider>().disposeValues();
          NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboard);
        }
      } on Exception catch (e) {
        ToastHelper.somethingWentWrong();
        Logger.logError(e);
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      ToastHelper.showToast('No Items to order');
    }
  }
}

List<ProductDetailModel> list = <ProductDetailModel>[
  ProductDetailModel(
      name: 'Living room',
      items: [
        ItemModel(name: 'Chair', qty: 0),
        ItemModel(name: 'Table', qty: 0),
        ItemModel(name: 'Sofa', qty: 0),
      ],
      doesItemsHaveQty: false),
  ProductDetailModel(
      name: 'Bedroom Room',
      items: [
        ItemModel(name: 'Chair', qty: 0),
        ItemModel(name: 'Table', qty: 0),
        ItemModel(name: 'Sofa', qty: 0),
      ],
      doesItemsHaveQty: false),
];
