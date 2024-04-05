import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../core/app_export.dart';
import '../../core/utils/enums.dart';
import '../providers/app_state_provider.dart';
import 'api_log_interceptor.dart';

class ApiCalling {
  late Dio _dio;
  final NetworkInfo _networkInfo = NetworkInfo();

  Future<CustomResponse> callApi(
      {required ApiTypes apiTypes,
      required String url,
      Object? data,
      String? token,
      Map<String, String?>? optionalHeader,
      ResponseType? responseType}) async {
    bool hasExpired = false;
    if (token != null) {
      hasExpired = JwtDecoder.isExpired(token);
      Logger.log(
          'Jwt token will Expire on: ${JwtDecoder.getExpirationDate(token)}');
    }
    if (hasExpired) {
      return CustomResponse(error: CustomException.tokenExpired.message);
    }
    final bool isConnected = await _networkInfo.isConnected();
    if (!isConnected) {
      if (NavigatorService.navigatorKey.currentContext != null) {
        final bool isNoInternetScreenMounted = NavigatorService
            .navigatorKey.currentContext!
            .read<AppStateProvider>()
            .isNoInternetScreenOpen;
        if (!isNoInternetScreenMounted) {
          NavigatorService.pushNamed(AppRoutes.noInternetScreen);
        }
      }
      return CustomResponse(error: CustomException.noInternet.message);
    }

    try {
      Response<dynamic> response;
      _initDio(
          token: token,
          responseType: responseType,
          optionalHeader: optionalHeader);
      switch (apiTypes) {
        case ApiTypes.get:
          response = await _dio.get(url);
          break;
        case ApiTypes.post:
          response = await _dio.post(url, data: data);
          break;
        case ApiTypes.put:
          response = await _dio.put(url, data: data);
          break;
        case ApiTypes.delete:
          response = await _dio.delete(url, data: data);
          break;
      }
      return CustomResponse(
          response: response, statusCode: response.statusCode);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.response?.statusCode == 500) {
        if (NavigatorService.navigatorKey.currentContext != null) {
          final bool isSeverErrorScreenMounted = NavigatorService
              .navigatorKey.currentContext!
              .read<AppStateProvider>()
              .isSeverErrorScreenOpen;
          if (!isSeverErrorScreenMounted) {
            NavigatorService.pushNamed(AppRoutes.serverErrorScreen);
          }
        }
        return CustomResponse(
            error: CustomException.serverError.message,
            statusCode: e.response?.statusCode);
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return CustomResponse(
            error: CustomException.timeOutError.message,
            statusCode: e.response?.statusCode);
      }
      if (e.response != null) {
        return CustomResponse(
            response: e.response, statusCode: e.response?.statusCode);
      } else {
        return CustomResponse();
      }
    }
  }

  void _initDio(
      {required String? token,
      required Map<String, String?>? optionalHeader,
      required ResponseType? responseType}) {
    String? authorization;
    authorization = token;
    late Map<String, String?> header;
    if (optionalHeader != null) {
      header = optionalHeader;
    } else {
      header = <String, String?>{
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': authorization == null ? '' : 'Bearer $authorization',
      };
    }
    final BaseOptions options = BaseOptions(
        receiveTimeout: const Duration(seconds: 100),
        connectTimeout: const Duration(seconds: 100),
        headers: header,
        responseType: responseType ?? ResponseType.json);
    _dio = Dio(options);
    if (Logger.mode == LogMode.debug) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }
}

class CustomResponse {
  CustomResponse(
      {this.response, this.statusCode, this.error = 'Something Went Wrong'});

  final Response<dynamic>? response;
  final int? statusCode;
  String error;
}
