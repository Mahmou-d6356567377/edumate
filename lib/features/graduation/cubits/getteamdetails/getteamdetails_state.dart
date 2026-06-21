part of 'getteamdetails_cubit.dart';

@immutable
abstract class GetteamdetailsState {}

class GetteamdetailsInitial extends GetteamdetailsState {}

class GetteamdetailsSuccess extends GetteamdetailsState {
  final TeamDetailsModel teamDetails;
  GetteamdetailsSuccess({required this.teamDetails});
}

class GetteamdetailsFailure extends GetteamdetailsState {
  final String message;
  GetteamdetailsFailure({required this.message});
}

class GetteamdetailsLoading extends GetteamdetailsState {}
