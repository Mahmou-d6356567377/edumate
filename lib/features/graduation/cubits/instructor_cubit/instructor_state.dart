part of 'instructor_cubit.dart';

@immutable
abstract class InstructorState {}

class InstructorInitial extends InstructorState {}

class InstructorLoading extends InstructorState {}

class InstructorSuccess extends InstructorState {
  final List<InstructorModel> instructors;
  InstructorSuccess({required this.instructors});
}

class InstructorFailure extends InstructorState {
  final String message;
  InstructorFailure({required this.message});
}
