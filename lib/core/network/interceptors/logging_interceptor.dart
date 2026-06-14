import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('>>> REQUEST: ${options.method} ${options.uri}');
    debugPrint('>>> HEADERS: ${options.headers}');
    debugPrint('>>> BODY: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('>>> RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
    debugPrint('>>> DATA: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('>>> ERROR: ${err.response?.statusCode} ${err.requestOptions.uri}');
    debugPrint('>>> ERROR BODY: ${err.response?.data}');
    handler.next(err);
  }
}