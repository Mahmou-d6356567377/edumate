part of 'getgraduationteams_cubit.dart';

@immutable
abstract class GetgraduationteamsState {}

class GetgraduationteamsInitial extends GetgraduationteamsState {}

class GetgraduationteamsLoading extends GetgraduationteamsState {}

class GetgraduationteamsSuccess extends GetgraduationteamsState {
  final GraduationTeamModel teams;

  GetgraduationteamsSuccess({required this.teams});
}

class GetgraduationteamsFailure extends GetgraduationteamsState {
  final String message;
  GetgraduationteamsFailure({required this.message});
}
