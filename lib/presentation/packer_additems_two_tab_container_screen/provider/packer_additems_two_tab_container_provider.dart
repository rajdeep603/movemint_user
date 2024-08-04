import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/toast_helper.dart';
import '../../../domain/models/create_order_request_model.dart';
import '../../../domain/models/get_item_data_response_model.dart';
import '../../../domain/models/razorypay_model/create_order_razor_pay_response_model.dart';
import '../../../domain/providers/create_order_provider.dart';
import '../../../domain/services/common_api_call.dart';
import '../../../domain/services/razorpay_services.dart';
import '../models/packer_additems_two_tab_container_model.dart';

final dummyData = {
  "success": true,
  "message": "successful",
  "data": [
    {
      "category_name": "Household",
      "category_id": "66974cc75d10219433af3ca3",
      "items": [
        {
          "subcategory_name": "Living Room",
          "subcategory_id": "66974d2e5d10219433af3ca5",
          "items": [
            {
              "_id": "66974c475d10219433af3ca1",
              "name": "table",
              "price_per_km": "200",
              "qty": 0
            }
          ]
        },
      ]
    },
    {
      "category_name": "Others",
      "category_id": "669bb5013ae7b4d51b1f4338",
      "items": [
        {
          "subcategory_name": "Bed Room",
          "subcategory_id": "669ea093d299141c2358267f",
          "items": [
            {
              "_id": "669fe6d880a8ced6d4407e67",
              "name": "sofa",
              "price_per_km": "25",
              "qty": 0
            }
          ]
        }
      ]
    }
  ]
};

class PackerAddItemsProvider extends ChangeNotifier {
  PackerAddItemsProvider(this.screenContext) {
    screenContext.read<CreateOrderProvider>().productDetail = List.from(list);
    _initializeRazorPay();

    itemData = GetItemDataResponseModel.fromMap(dummyData);
    print('GetItemDataResponseModel ${itemData.data?.length}');
  }

  BuildContext screenContext;

  // List<ProductDetailModel> productListModel = <ProductDetailModel>[];
  bool isLoading = false;

  late RazorpayService razorpayService;
  CreateOrderRazorPayResponseModel? createOrderRazorPayResponseModel;
  GetItemDataResponseModel? getItemDataResponseModel;

  late GetItemDataResponseModel itemData;

  int totalItmes = 0;
  double totalPrice = 0;

  // List<int> totalItemsQuantity = []

  Future<void> onNextClickEvent(BuildContext context) async {
    // if (screenContext.read<CreateOrderProvider>().productDetail.any((ProductDetailModel element) => element.doesItemsHaveQty)) {
    //   try {
    //     isLoading = true;
    //     notifyListeners();
    //     final bool value =
    //         await context.read<CreateOrderProvider>().createOrder();
    //     if (value) {
    //       context.read<CreateOrderProvider>().disposeValues();
    //       NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboard);
    //     }
    //   } on Exception catch (e) {
    //     ToastHelper.somethingWentWrong();
    //     Logger.logError(e);
    //   } finally {
    //     isLoading = false;
    //     notifyListeners();
    //   }
    // } else {
    //   ToastHelper.showToast('No Items to order');
    // }
  }

  void _initializeRazorPay() {
    razorpayService = RazorpayService();
    razorpayService.initializeRazorpay(
      handleExternalWallet: _handleExternalWallet,
      handlePaymentError: _handlePaymentError,
      handlePaymentSuccess: (PaymentSuccessResponse paymentSuccessResponse) =>
          _handlePaymentSuccess(paymentSuccessResponse),
    );
  }

  Future<void> onPayEvent() async {
    try {
      isLoading = true;
      notifyListeners();
      createOrderRazorPayResponseModel = await createRazorPayOrder();
      if (createOrderRazorPayResponseModel?.orderId == null ||
          createOrderRazorPayResponseModel?.status == null) {
        createOrderRazorPayResponseModel = null;
        ToastHelper.showToast('There is some issue with Payment Gateway');
        return;
      }
      await razorpayService.startPayment(
          amount: 100,
          description: 'Testing',
          orderId: createOrderRazorPayResponseModel!.orderId!);
    } on Exception catch (e) {
      Logger.logError(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<CreateOrderRazorPayResponseModel?> createRazorPayOrder() async {
    final CustomResponse customResponse =
        await razorpayService.createOrder(amount: 100);
    if (customResponse.response?.data == null &&
        customResponse.statusCode != 200) {
      ToastHelper.showToast(
          customResponse.response?.statusMessage ?? 'Request failed');
      return null;
    }
    final CreateOrderRazorPayResponseModel createOrderRazorPayResponseModel =
        CreateOrderRazorPayResponseModel.fromMap(customResponse.response?.data);
    if ((createOrderRazorPayResponseModel.orderId?.isEmpty ?? true) ||
        (createOrderRazorPayResponseModel.status?.isEmpty ?? true)) {
      return null;
    }
    return createOrderRazorPayResponseModel;
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      isLoading = true;
      notifyListeners();
      Logger.log(
          'Payment Successful: ${response.paymentId}||${response.signature} ${response.orderId}||${response.data}');
      final bool value =
          await screenContext.read<CreateOrderProvider>().createOrder();
      if (value) {
        screenContext.read<CreateOrderProvider>().disposeValues();
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboard);
      }
    } on Exception catch (e) {
      ToastHelper.somethingWentWrong();
      Logger.logError(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _handlePaymentError(PaymentFailureResponse response) async {
    try {
      ToastHelper.showToast(
          response.message ?? CustomException.unknownError.message);
    } on Exception catch (e) {
      Logger.logError(e);
    } finally {}
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    Logger.log('External Wallet: ${response.walletName}');
  }

  @override
  void notifyListeners() {
    if (hasListeners) {
      if (screenContext.mounted) {
        super.notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    razorpayService.dispose();
    super.dispose();
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
