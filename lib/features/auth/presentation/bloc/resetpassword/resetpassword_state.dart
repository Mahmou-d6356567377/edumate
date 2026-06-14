part of 'resetpassword_cubit.dart';

@immutable
abstract class ResetpasswordState {}

class ResetpasswordInitial extends ResetpasswordState {}

class ResetpasswordLoading extends ResetpasswordState {}
class ResetpasswordSuccess extends ResetpasswordState {
  final String message;

  ResetpasswordSuccess(this.message);
}

class ResetpasswordFailure extends ResetpasswordState {
  final String message;
  final int? statusCode;

  ResetpasswordFailure(this.message, this.statusCode);
}