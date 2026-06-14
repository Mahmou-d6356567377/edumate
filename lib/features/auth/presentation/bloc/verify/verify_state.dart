part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}
class VerifyLoading extends VerifyState {}
class VerifySuccess extends VerifyState {
  final String message;
  VerifySuccess(this.message);
}
class VerifyFailure extends VerifyState {
  final String errorMessage;
  final int? statusCode;
  VerifyFailure(this.errorMessage, this.statusCode);
}
