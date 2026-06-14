import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String message;
  final int statusCode;

  const AppException(this.message, this.statusCode);
}

class ServerException extends AppException {
  const ServerException([
    super.message = 'Server Error',
    super.statusCode = 500,
  ]);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache Error', super.statusCode = 500]);
}

class NetworkException extends AppException {
  const NetworkException([
    super.message = 'No Internet Connection',
    super.statusCode = 503,
  ]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Unauthorized',
    super.statusCode = 401,
  ]);
}


class DioExceptionMapper {
  static AppException map(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const ServerException('Request timed out', 408);
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 500;
        final message = e.response?.data['message'] ?? 'Server Error';
        if (statusCode == 401) return UnauthorizedException(message, 401);
        return ServerException(message, statusCode);
      default:
        return const ServerException();
    }
  }
}