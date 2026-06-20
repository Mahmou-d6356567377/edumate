part of 'getcomments_cubit.dart';

@immutable
abstract class GetcommentsState {}

class GetcommentsInitial extends GetcommentsState {}

class GetcommentsLoading extends GetcommentsState {}

class GetcommentsSuccess extends GetcommentsState {
  final List<CommentModel> comments;
  GetcommentsSuccess({required this.comments});
}

class GetcommentsFailure extends GetcommentsState {
  final String message;
  GetcommentsFailure({required this.message});
}
