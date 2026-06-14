import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({
    required String url,
    String? token,
  }) async {
    final response = await dio.get(
      url,
      options: Options(
        headers: token != null ? {'Authorization': 'Bearer $token'} : {},
      ),
    );
    return response.data;
  }

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    // required String token,
    String? contentType,
  }) async {
    final response = await dio.post(
      url,
      data: body,
      options: Options(
        // headers: {'Authorization': 'Bearer $token'},
        contentType: contentType ?? 'application/json',
      ),
    );
    return response;
  }

  Future<Map<String, dynamic>> del({
    required String url,
    String? token,
  }) async {
    final response = await dio.delete(
      url,
      options: Options(
        headers: token != null ? {'Authorization': 'Bearer $token'} : {},
      ),
    );
    return response.data;
  }
}