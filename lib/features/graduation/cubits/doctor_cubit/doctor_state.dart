part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorSuccess extends DoctorState {
  final List<InstructorModel> doctors;
  DoctorSuccess({required this.doctors});
}

class DoctorFailure extends DoctorState {
  final String message;
  DoctorFailure({required this.message});
}
