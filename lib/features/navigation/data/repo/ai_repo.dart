import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/navigation/data/models/ai_chats_item_model.dart';

abstract class AiRepo {
  Future<Either<Failure, String>> addAIChat();
  Future<Either<Failure, List<AiChatsItemModel>>> getallAIChats();
  Future<Either<Failure, String>> askAI({
    required String chatId,
    required String message,
  });
}
