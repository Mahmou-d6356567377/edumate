import 'package:edumate/features/navigation/data/models/ai_chats_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edumate/features/navigation/data/repo/ai_repo.dart';
part 'getallchats_state.dart';

class GetAllChatsCubit extends Cubit<GetAllChatsState> {
  final AiRepo aiRepo;
  GetAllChatsCubit({required this.aiRepo}) : super(GetAllChatsInitial());

  Future<void> getAllChats() async {
    emit(GetAllChatsLoading());
    final result = await aiRepo.getallAIChats();
    result.fold(
      (failure) => emit(GetAllChatsFailure(failure.message)),
      (chats) => emit(GetAllChatsSuccess(chats)),
    );
  }
}
