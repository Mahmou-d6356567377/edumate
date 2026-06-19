import 'package:edumate/features/attendence/cubit/attendance_cubit_state.dart';
import 'package:edumate/features/attendence/data/repo/attendence_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit({required this.attendenceRepo}) : super(AttendanceInitial());
  final AttendenceRepo attendenceRepo;

  String? qrData;
  bool isLocationValid = false;
  Position? currentPosition; // ✅ store full position object

  final double classLat = 30.123456;
  final double classLng = 31.123456;

  /// Called from initState after QR scan
  Future<void> setQr(String data) async {
    qrData = data;
    emit(AttendanceLoading());
    await checkLocation();
  }

  Future<void> checkLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        emit(AttendanceError("Please enable GPS on your device"));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        emit(AttendanceError("Allow location from app settings"));
        return;
      }

      if (permission == LocationPermission.denied) {

        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          emit(AttendanceError("Location permission denied"));
          return;
        }
      }

      // ✅ Use LocationSettings instead of desiredAccuracy directly
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      currentPosition = position;
      print(">>>>>>>>>>>>>>>>>>> Position: $position");
      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        classLat,
        classLng,
      );

      isLocationValid = distance < 50;
      emit(
        AttendanceReady(
          qrData: qrData,
        ),
      );
      print("Location is valid: $isLocationValid");

      if (!isLocationValid) {
        emit(
          AttendanceError(
            "You're ${distance.toStringAsFixed(0)}m away from class. Get within 50m to mark attendance.",
          ),
        );
      }
    } catch (e) {
      emit(AttendanceError("Location error: $e"));
      print("Last Location error: $e");
    }
  }

  Future<void> attendenceComfirmation() async {
    if (qrData == null || currentPosition == null || !isLocationValid) {
      emit(AttendanceError("Missing QR or location"));
      print("Missing QR or location");
      return;
    }

    emit(AttendanceLoading());
    final result = await attendenceRepo.confirmAttendance(
      latitude: currentPosition!.latitude,
      longitude: currentPosition!.longitude,
      qrToken: qrData!,
    );
    result.fold(
      (failure) => emit(AttendanceError(failure.message)),
      (message) => emit(AttendanceSuccess(message)),
    );
  }
}
