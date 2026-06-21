import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/navigation/data/models/ai_askresponse_model.dart';
import 'package:edumate/features/navigation/data/models/ai_chats_item_model.dart';

abstract class AiRepo {
  Future<Either<Failure, String>> addAIChat();
  Future<Either<Failure, List<AiChatsItemModel>>> getallAIChats();
  // Future<Either<Failure, AiAskresponseModel>> askAI({
  //   required String chatId,
  //   required String message,
  // });
  Future<Either<Failure, AiAskresponseModel>> askAI2({
    required String chatId,
    required String message,
  });
}
