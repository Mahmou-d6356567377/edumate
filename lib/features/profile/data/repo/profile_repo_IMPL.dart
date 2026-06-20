import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/profile/data/models/userprofilemodel.dart';
import 'package:edumate/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  UserProfileRepoImpl({required this.apiService, required this.secureStorage});

  @override
  Future<Either<Failure, Userprofilemodel>> getUserProfile() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.get(
        url: '${VidConsts.apiBaseURL}/api/Auth/me',
        token: token,
      );
      print('Profile ::::::::::::::::::response: $response , token: $token');
      final userProfile = Userprofilemodel.fromJson(response);
      await secureStorage.write(
        key: VidConsts.name,
        value: userProfile.fullName,
      );
      return Right(userProfile);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      print(
        'Profile ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
