import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  RefreshTokenInterceptor({required this.dio, required this.secureStorage});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("🔥 DIO ERROR STATUS: ${err.response?.statusCode}");
    print("🔥 DIO ERROR URL: ${err.requestOptions.uri}");
    if (err.response?.statusCode == 401) {
      try {
        final newToken = await _refreshToken();
        if (newToken != null) {
          // ✅ retry the original request with new token
          print('Refreshing token... $newToken');
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newToken';
          final response = await dio.fetch(options);

          return handler.resolve(response);
        }
      } on DioException catch (e) {
        print('REFRESH STATUS: ${e.response?.statusCode}');
        print('REFRESH BODY: ${e.response?.data}');
        rethrow;
      } catch (e) {
        print('Refresh token failed: $e');
      }
    }
    handler.next(err);
  }

  Future<String?> _refreshToken() async {
    print('1.....in refresh token interceptor...');
    final oldToken = await secureStorage.read(key: VidConsts.tokenaccesskey);
    final refreshToken = await secureStorage.read(key: VidConsts.refrechtoken);
    final email = await secureStorage.read(key: VidConsts.email);
    print('1.....in refresh token interceptor...OLD TOKEN: $oldToken');
    print('1.....in refresh token interceptor...REFRESH TOKEN: $refreshToken');
    print('1.....in refresh token interceptor...EMAIL: $email');
    if (refreshToken == null || email == null) return null;

    // ✅ use a fresh Dio instance to avoid interceptor loop
    final freshDio = Dio();
    final response = await freshDio.post(
      '${VidConsts.apiBaseURL}/api/Auth/refresh-token',
      data: {'email': email, 'refreshToken': refreshToken},
      // options: Options(
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      // ),
    );

    final newToken = response.data['token'];
    final newRefreshToken = response.data['refreshToken'];

    // ✅ save the new tokens
    await secureStorage.write(key: VidConsts.tokenaccesskey, value: newToken);
    if (newRefreshToken != null) {
      await secureStorage.write(
        key: VidConsts.refrechtoken,
        value: newRefreshToken,
      );
    }
    print('2.....in refresh token interceptor...OLD TOKEN: $oldToken');
    print('2.....in refresh token interceptor...REFRESH TOKEN: $refreshToken');
    print('2.....in refresh token interceptor...EMAIL: $email');
    return newToken;
  }
}
