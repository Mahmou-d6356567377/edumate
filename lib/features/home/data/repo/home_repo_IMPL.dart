import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/home/data/models/time_line_model/time_line_model.dart';
import 'package:edumate/features/home/data/repo/home_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;
  HomeRepoImpl({required this.apiService, required this.secureStorage});

  @override
  Future<Either<Failure, List<TimeLineModel>>> getCourses({
    required String date,
  }) async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.getList(
        url:
            '${VidConsts.apiBaseURL}/api/Timeline/user-daily-schedule?date=$date',
        token: token,
      );
      print('TimeLine ::::::::::::::::::response: $response , token: $token');
      final courses =
          response
              .map((e) => TimeLineModel.fromJson(e as Map<String, dynamic>))
              .toList();

      return Right(courses);
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
