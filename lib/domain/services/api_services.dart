import '../../core/constants/url_constants.dart';
import '../../core/utils/enums.dart';
import '../../core/utils/logger.dart';
import '../local_storage/local_storage.dart';
import '../models/create_order_request_model.dart';
import '../models/sign_in_model/sign_in_request_model.dart';
import '../models/sign_up_model.dart';
import 'common_api_call.dart';

class ApiServices {
  String? _getToken() {
    return LocalStorage.getToken() ??
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTA0MDVmNDMxODQ5NzdjMzVkMzM4MCIsImlhdCI6MTcxMjQ5ODIzMSwiZXhwIjoxNzEyNTg0NjMxfQ.jE1QVN7Zq1qj_vH0wcpQy1IJnN-J9-PqWVGV6ZQMmKg';
  }

  Future<CustomResponse> signIn(SignInRequestModel signInModel) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.post,
          url: AppUrls.signIn,
          data: signInModel.toMap());
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }

  Future<CustomResponse> signUp(SignUpModel signUpModel) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.post,
          url: AppUrls.signUp,
          data: signUpModel.toMap());
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }

  Future<CustomResponse> checkUserExists(String mobileNo) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.get,
          url: '${AppUrls.checkUserExists}?phone=$mobileNo');
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }

  Future<CustomResponse> getOrders() async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.get, url: AppUrls.getOrders, token: _getToken());
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }

  Future<CustomResponse> createOrder(CreateOrderModel createOrderModel) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.post,
          url: AppUrls.createOrder,
          token: _getToken(),
          data: createOrderModel.toMap());
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }

  Future<CustomResponse> cancelOrder(CreateOrderModel createOrderModel) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.post,
          url: AppUrls.cancelOrder,
          token: _getToken(),
          data: createOrderModel.toMap());
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }
}
