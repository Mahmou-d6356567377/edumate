part of 'streampeople_cubit.dart';

@immutable
abstract class StreampeopleState {}

class StreampeopleInitial extends StreampeopleState {}

class StreampeopleLoading extends StreampeopleState {}

class StreampeopleSuccess extends StreampeopleState {
  final PeopleModel users;  // ✅ not a List
  StreampeopleSuccess({required this.users});
}

class StreampeopleFailure extends StreampeopleState {
  final String message;
  StreampeopleFailure(this.message);
}