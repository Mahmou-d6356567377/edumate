import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';

abstract class AttendenceRepo {
  Future<Either<Failure, String>> confirmAttendance({
    required double latitude,
    required double longitude,
    required String qrToken,
  });
}
