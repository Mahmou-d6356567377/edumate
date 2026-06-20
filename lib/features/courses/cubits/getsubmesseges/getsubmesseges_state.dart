part of 'getsubmesseges_cubit.dart';

abstract class GetstreammessegesState {}

class GetstreammessegesInitial extends GetstreammessegesState {}

class GetStreammessegesLoading extends GetstreammessegesState {}

class GetStreammessegesSuccess extends GetstreammessegesState {
  final List<StreamMessageModel> streamMessages;
  GetStreammessegesSuccess({required this.streamMessages});
}

class GetStreammessegesFailure extends GetstreammessegesState {
  final String message;
  GetStreammessegesFailure({required this.message});
}
