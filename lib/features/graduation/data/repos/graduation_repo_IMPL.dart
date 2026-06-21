import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/courses/data/models/people_model/people_model.dart';
import 'package:edumate/features/graduation/data/models/graduation_team_model/graduation_team_model.dart';
import 'package:edumate/features/graduation/data/models/instructor_model.dart';
import 'package:edumate/features/graduation/data/models/team_details_model/team_details_model.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GraduationRepoImpl implements GraduationRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  GraduationRepoImpl(this.apiService, this.secureStorage);

  @override
  Future<Either<Failure, List<InstructorModel>>> getinstructors() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.getList(
        url:
            "${VidConsts.apiBaseURL}/api/Instructor/get-all-ta's?PageNumber=1&PageSize=8189",
        token: token,
      );
      final instructors =
          response
              .map((e) => InstructorModel.fromJson(e as Map<String, dynamic>))
              .toList();
      print('.......................instructors: $instructors');
      return Right(instructors);
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

  @override
  Future<Either<Failure, List<InstructorModel>>> getalldoctors() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.getList(
        url:
            "${VidConsts.apiBaseURL}/api/Instructor/get-all-doctor's?PageNumber=1&PageSize=8189",
        token: token,
      );
      final doctors =
          response
              .map((e) => InstructorModel.fromJson(e as Map<String, dynamic>))
              .toList();
      print('........................doctors: $doctors');
      return Right(doctors);
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

  @override
  Future<Either<Failure, GraduationTeamModel>> getGraduationTeams() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.get(
        url: '${VidConsts.apiBaseURL}/api/project-teams',
        token: token,
      );
      print(
        'get graduation teams ::::::::::::::::::response: $response , token: $token',
      );

      final people = GraduationTeamModel.fromJson(response);
      return Right(people);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      print(
        'course people ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  @override
  Future<Either<Failure, TeamDetailsModel>> getTeamDetails({
    required String id,
  }) async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.get(
        url: '${VidConsts.apiBaseURL}/api/project-teams/$id',
        token: token,
      );
      print(
        'Team Details ::::::::::::::::::response: $response , token: $token',
      );
      final teamDetails = TeamDetailsModel.fromJson(response);
      print('>> teamDetails: $teamDetails');
      return Right(teamDetails);
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
