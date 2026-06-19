abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceReady extends AttendanceState {
  final String? qrData;

  AttendanceReady({required this.qrData});
}

class AttendanceSuccess extends AttendanceState {
  final String message;

  AttendanceSuccess(this.message);
}

class AttendanceError extends AttendanceState {
  final String message;

  AttendanceError(this.message);
}