part of 'askai_cubit.dart';

abstract class AskAIState {}

class AskAIInitial extends AskAIState {}

class AskAILoading extends AskAIState {}

class AskAISuccess extends AskAIState {
  final String response;
  final String question;

  AskAISuccess(this.response, this.question);
}

class AskAIFailure extends AskAIState {
  final String message;
  AskAIFailure(this.message);
}
