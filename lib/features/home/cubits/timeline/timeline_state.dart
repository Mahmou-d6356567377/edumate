part of 'timeline_cubit.dart';

@immutable
abstract class TimelineState {}

class TimelineInitial extends TimelineState {}

class TimelineSuccess extends TimelineState {
  final List<TimeLineModel> timeline;
  TimelineSuccess({required this.timeline});
}

class TimelineFailure extends TimelineState {
  final String message;
  TimelineFailure({required this.message});
}

class TimelineLoading extends TimelineState {}
