
import '../local_storage/local_storage.dart';


class ApiServices {
  String? _getToken() {
    return LocalStorage.getToken();
  }

  // Future<CustomResponse> getDateTime() async {
  //   try {
  //     final CustomResponse customResponse = await ApiCalling().callApi(
  //         apiTypes: ApiTypes.get,
  //         url: AppUrls.getDateTime,
  //         responseType: ResponseType.plain);
  //     return customResponse;
  //   } on Exception catch (e) {
  //     Logger.logError(e);
  //     return CustomResponse();
  //   }
  // }

  // Future<CustomResponse> fetchFamilyRelations() async {
  //   try {
  //     final String? token = _getToken();
  //     final CustomResponse customResponse = await ApiCalling().callApi(
  //         apiTypes: ApiTypes.get, url: AppUrls.familyRelations, token: token);
  //     return customResponse;
  //   } on Exception catch (e) {
  //     Logger.logError(e);
  //     return CustomResponse();
  //   }
  // }

}
