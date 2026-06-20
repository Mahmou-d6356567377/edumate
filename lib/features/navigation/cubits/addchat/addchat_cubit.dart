import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edumate/features/navigation/data/repo/ai_repo.dart';
part 'addchat_state.dart';

class AddChatCubit extends Cubit<AddChatState> {
  final AiRepo aiRepo;
  AddChatCubit({required this.aiRepo}) : super(AddChatInitial());

  Future<void> addChat() async {
    emit(AddChatLoading());
    final result = await aiRepo.addAIChat();
    result.fold(
      (failure) => emit(AddChatFailure(failure.message)),
      (chatId) => emit(AddChatSuccess(chatId)),
    );
  }
}
