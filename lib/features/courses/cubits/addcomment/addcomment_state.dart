// addcomment_state.dart
part of 'addcomment_cubit.dart';

@immutable
abstract class AddcommentState {}

class AddcommentInitial extends AddcommentState {}

class AddcommentLoading extends AddcommentState {}

class AddcommentSuccess extends AddcommentState {
  final String message;
  AddcommentSuccess(this.message);
}

class AddcommentFailure extends AddcommentState {
  final String message;
  AddcommentFailure(this.message);
}
