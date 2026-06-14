import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/auth/data/models/login_response_model.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AuthRepoImpl({required this.apiService, required this.secureStorage});

  @override
  Future<bool> isLoggedIn() async {
    final token = await secureStorage.read(key: 'access_token');
    return token != null && token.isNotEmpty;
  }
   

  @override
  Future<Either<Failure, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/auth/login',
        body: {'email': email, 'password': password},
      );

      final loginResponse = LoginResponseModel.fromJson(response.data);

      // Persist auth data
      await secureStorage.write(
        key: 'access_token',
        value: loginResponse.token,
      );
      await secureStorage.write(
        key: 'refresh_token',
        value: loginResponse.refreshToken,
      );
      await secureStorage.write(
        key: 'token_expiration',
        value: loginResponse.expiration,
      );

      final savedToken = await secureStorage.read(key: 'access_token');
      final savedRefresh = await secureStorage.read(key: 'refresh_token');
      final savedExpiration = await secureStorage.read(key: 'token_expiration');

      print('>>> SAVED ACCESS TOKEN: $savedToken');
      print('>>> SAVED REFRESH TOKEN: $savedRefresh');
      print('>>> SAVED EXPIRATION: $savedExpiration');
      return Right(loginResponse);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  Future<Either<Failure, String>> verify(String email, String code) async {
    try {
      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/Auth/verify',
        body: {'email': email, 'code': code},
      );
      return Right(response.data.toString());
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      return Left(ServerFailure(message, statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  Future<Either<Failure, String>> registerStudent(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/Auth/register-student',
        body: {'name': name, 'email': email, 'password': password},
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      return Left(ServerFailure(message, statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  Future<Either<Failure, String>> forgetPassword(String email) async {
    Response? response; // declare outside
    try {
      print(
        '>>>>>>>>>>>>>>Full URL: ${VidConsts.apiBaseURL}/api/Auth/forgot-password',
      );
      response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/Auth/forgot-password',
        body: {'email': email},
      );
      final message =
          response.data is String
              ? response.data as String
              : response.data['message'] as String;
      return Right(message);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      return Left(ServerFailure(message, statusCode));
    } catch (e) {
      print('>>>>>>>>>>>>>>Exception: ${e.toString()}'); // log the exception
      return Left(ServerFailure(e.toString(), null));
    }
  }

  Future<Either<Failure, String>> resetpassword(
    String code,
    String email,
    String newpassword,
  ) async {
    try {
      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/Auth/reset-password',
        body: {'code': code, 'email': email, 'newpassword': newpassword},
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      return Left(ServerFailure(message, statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
