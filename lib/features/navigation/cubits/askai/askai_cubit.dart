import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edumate/features/navigation/data/repo/ai_repo.dart';
part 'askai_state.dart';

class AskAICubit extends Cubit<AskAIState> {
  final AiRepo aiRepo;
  AskAICubit({required this.aiRepo}) : super(AskAIInitial());

  Future<void> askAI({required String chatId, required String message}) async {
    emit(AskAILoading());
    final result = await aiRepo.askAI(chatId: chatId, message: message);
    result.fold(
      (failure) => emit(AskAIFailure(failure.message)),
      (response) => emit(AskAISuccess(response, message)),
    );
  }

  void reset() {
    emit(AskAIInitial());
  }
}
