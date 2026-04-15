abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceReady extends AttendanceState {
  final bool isLocationValid;
  final String? qrData;

  AttendanceReady({
    required this.isLocationValid,
    required this.qrData,
  });
}

class AttendanceSuccess extends AttendanceState {}

class AttendanceError extends AttendanceState {
  final String message;

  AttendanceError(this.message);
}