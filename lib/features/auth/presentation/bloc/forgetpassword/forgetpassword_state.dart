part of 'forgetpassword_cubit.dart';

@immutable
abstract class ForgetpasswordState {}

class ForgetpasswordInitial extends ForgetpasswordState {}

class ForgetpasswordLoading extends ForgetpasswordState {}

class ForgetpasswordSuccess extends ForgetpasswordState {
  final String message;
  ForgetpasswordSuccess(this.message);
}

class ForgetpasswordFailure extends ForgetpasswordState {
  final String errorMessage;
  final int? statusCode;
  ForgetpasswordFailure(this.errorMessage, this.statusCode);
}
