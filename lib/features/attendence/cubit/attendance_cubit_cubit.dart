import 'package:edumate/features/attendence/cubit/attendance_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';


class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  String? qrData;
  bool isLocationValid = false;

  final double classLat = 30.123456;
  final double classLng = 31.123456;

  /// Step 1: Set QR
  Future<void> setQr(String data) async {
    qrData = data;
    emit(AttendanceLoading());
    await checkLocation();
  }

  /// Step 2: Check Location
  Future<void> checkLocation() async {
    try {
      LocationPermission permission =
          await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        emit(AttendanceError("Location permission denied"));
        return;
      }

      Position position =
          await Geolocator.getCurrentPosition();

      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        classLat,
        classLng,
      );

      isLocationValid = distance < 50;

      emit(AttendanceReady(
        isLocationValid: isLocationValid,
        qrData: qrData,
      ));
    } catch (e) {
      emit(AttendanceError("Location error"));
    }
  }

  /// Step 3: Submit
  Future<void> submit() async {
    if (qrData == null || !isLocationValid) {
      emit(AttendanceError("Validation failed"));
      return;
    }

    emit(AttendanceLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(AttendanceSuccess());
  }
}