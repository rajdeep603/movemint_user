import '../../core/constants/url_constants.dart';
import '../../core/utils/enums.dart';
import '../../core/utils/logger.dart';
import '../local_storage/local_storage.dart';
import '../models/sign_in_model/sign_in_request_model.dart';
import '../models/sign_up_model.dart';
import 'common_api_call.dart';

class ApiServices {
  String? _getToken() {
    return LocalStorage.getToken();
  }

  Future<CustomResponse> signIn(SignInModel signInModel) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.post, url: AppUrls.signIn, data: signInModel.toMap());
      return customResponse;
    } on Exception catch (e) {
      Logger.logError(e);
      return CustomResponse();
    }
  }

  Future<CustomResponse> signUp(SignUpModel signUpModel) async {
    try {
      final CustomResponse customResponse = await ApiCalling().callApi(
          apiTypes: ApiTypes.post, url: AppUrls.signUp, data: signUpModel.toMap());
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
}
