import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/courses/data/models/comment_model.dart';
import 'package:edumate/features/courses/data/models/course_model/course_model1.dart';
import 'package:edumate/features/courses/data/models/people_model/people_model.dart';
import 'package:edumate/features/courses/data/models/stream_message_model/stream_message_model.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CourseRepoImpl implements CourseRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  CourseRepoImpl({required this.apiService, required this.secureStorage});

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.getList(
        url: '${VidConsts.apiBaseURL}/api/Students/get-courses',
        token: token,
      );
      print('Profile ::::::::::::::::::response: $response , token: $token');
      final courses =
          response
              .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
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

  @override
  Future<Either<Failure, List<StreamMessageModel>>> getsubjectPosts({
    required String courseId,
  }) async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.getList(
        url:
            '${VidConsts.apiBaseURL}/api/Stream/courses/$courseId/messages?PageNumber=1&PageSize=4323',
        token: token,
      );
      print(
        'get subject messages ::::::::::::::::::response: $response , token: $token',
      );
      final messeges =
          response
              .map(
                (e) => StreamMessageModel.fromJson(e as Map<String, dynamic>),
              )
              .toList();

      return Right(messeges);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      print(
        'subject messages ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getpostMesseges({
    required String msgId,
  }) async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.getList(
        url:
            '${VidConsts.apiBaseURL}/api/Stream/messages/$msgId/comments?PageNumber=4323&PageSize=4323',
        token: token,
      );
      print(
        'get messege comments ::::::::::::::::::response: $response , token: $token',
      );
      final messeges =
          response
              .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList();

      return Right(messeges);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      print(
        'messege comments ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  @override
  Future<Either<Failure, String>> addComent({
    required String messageId,
    required String content,
  }) async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);

      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/Stream/comments/add',
        body: {'token': token, 'messageId': messageId, 'content': content},
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
        'add  comment ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 400));
    }
  }
  
@override
Future<Either<Failure, PeopleModel>> getCoursePeople({
  required String courseId,
}) async {
  try {
    final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
    final response = await apiService.get(
      url: '${VidConsts.apiBaseURL}/api/Stream/people/$courseId?PageNumber=1&PageSize=1975',
      token: token,
    );
    print('get course people ::::::::::::::::::response: $response , token: $token');

    final people = PeopleModel.fromJson(response);
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

}
