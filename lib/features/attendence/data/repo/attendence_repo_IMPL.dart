import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/attendence/data/repo/attendence_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AttendenceRepoImpl implements AttendenceRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AttendenceRepoImpl(this.apiService, this.secureStorage);
  Future<Either<Failure, String>> confirmAttendance({
    required double latitude,
    required double longitude,
    required String qrToken,
  }) async {
    try {
      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/Attendancies/mark',
        body: {'token': qrToken, 'latitude': latitude, 'longitude': longitude},
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
      print(
        'Profile ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
