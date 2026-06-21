import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/navigation/data/models/ai_askresponse_model.dart';
import 'package:edumate/features/navigation/data/models/ai_chats_item_model.dart';
import 'package:edumate/features/navigation/data/repo/ai_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AiRepoImpl implements AiRepo {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AiRepoImpl(this.apiService, this.secureStorage);

  Future<Either<Failure, String>> addAIChat() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);

      // ✅ use dio directly to send token in header with no body
      final response = await apiService.dio.post(
        '${VidConsts.apiBaseURL}/api/ChatBot/chats/add',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final message =
          response.data is String
              ? response.data as String
              : response.data.toString();

      print(
        'AI Add Chat ::::::::::::::::::response: $response , token: $token',
      );
      return Right(message);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      print(
        'AI Add Chat ::::::::::::::::::message: $message, statusCode: $statusCode error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  @override
  Future<Either<Failure, List<AiChatsItemModel>>> getallAIChats() async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);

      final response = await apiService.getList(
        url: '${VidConsts.apiBaseURL}/api/ChatBot/chats',
        token: token,
      );

      final chats =
          response
              .map((e) => AiChatsItemModel.fromJson(e as Map<String, dynamic>))
              .toList();

      print(
        'AI Get All Chats ::::::::::::::::::response: $response , token: $token',
      );

      return Right(chats); // ✅ Fixed: was returning undefined `message`
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      print(
        'AI Get All Chats ::::::::::::::::::message: $message, statusCode: $statusCode  error: $e',
      );
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }

  @override
  Future<Either<Failure, AiAskresponseModel>> askAI2({
    required String chatId,
    required String message,
  }) async {
    try {
      final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
      final response = await apiService.post(
        url: '${VidConsts.apiBaseURL}/api/ChatBot/ask/$chatId',
        body: {'token': token, 'query': message},
      );
      final reply = AiAskresponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      return Right(reply);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;
      final message = detail ?? 'Server Error';
      final statusCode = e.response?.statusCode;
      return Left(ServerFailure(message.toString(), statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 400));
    }
  }

  // Future<Either<Failure, AiAskresponseModel>> askAI({
  //   required String chatId,
  //   required String message,
  // }) async {
  //   try {
  //     final token = await secureStorage.read(key: VidConsts.tokenaccesskey);
  //     final response = await apiService.dio.post(
  //       '${VidConsts.apiBaseURL}/api/ChatBot/ask/$chatId',

  //       data: jsonEncode(message), // wraps it in quotes: "who is..."
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //         contentType:
  //             'application/json', // ASP.NET Core expects this for [FromBody] string
  //       ),
  //     );
  //     final reply =
  //         response.data is AiAskresponseModel ? response.data as AiAskresponseModel : response.data.toString();

  //     return Right(reply as AiAskresponseModel);
  //   } on DioException catch (e) {
  //     final responseData = e.response?.data;
  //     final detail = responseData is Map ? responseData['detail'] : null;
  //     final message = detail ?? 'Server Error';
  //     final statusCode = e.response?.statusCode;
  //     return Left(ServerFailure(message.toString(), statusCode));
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString(), 500));
  //   }
  // }
}
