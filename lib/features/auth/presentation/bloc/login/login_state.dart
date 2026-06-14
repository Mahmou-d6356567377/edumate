part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponse;
  LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginState {
  final String errorMessage;
  final int? statusCode;
  LoginFailure(this.errorMessage, this.statusCode);
}
