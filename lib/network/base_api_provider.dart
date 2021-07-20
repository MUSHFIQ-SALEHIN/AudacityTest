import 'package:dio/dio.dart';

class BaseApiProvider {
  static const String TAG = 'BaseApiProvider';

  //nagadbazaar testing server

  static const String _baseUrl =
      'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=';

  static const String _contentType = 'Content-Type';

  Dio _dio;

  BaseApiProvider() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 60000,
      headers: {_contentType: 'application/json'},
    );
    _dio = Dio(dioOptions)..interceptors.add(LogInterceptor(requestHeader: false));
  }

  Dio getDio() => _dio;

  String handleError(DioError error) {
    String errorDescription = "";

    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
            "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
    return errorDescription;
  }
}
