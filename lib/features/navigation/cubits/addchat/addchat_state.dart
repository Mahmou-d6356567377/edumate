part of 'addchat_cubit.dart';

@immutable
abstract class AddChatState {}

class AddChatInitial extends AddChatState {}

class AddChatLoading extends AddChatState {}

class AddChatSuccess extends AddChatState {
  final String chatId;
  AddChatSuccess(this.chatId);
}

class AddChatFailure extends AddChatState {
  final String message;
  AddChatFailure(this.message);
}
