part of 'getallchats_cubit.dart';

abstract class GetAllChatsState {}

class GetAllChatsInitial extends GetAllChatsState {}

class GetAllChatsLoading extends GetAllChatsState {}

class GetAllChatsSuccess extends GetAllChatsState {
  final List<AiChatsItemModel> chats;
  GetAllChatsSuccess(this.chats);
}

class GetAllChatsFailure extends GetAllChatsState {
  final String message;
  GetAllChatsFailure(this.message);
}
