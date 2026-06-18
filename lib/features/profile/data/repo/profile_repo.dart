import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/profile/data/models/userprofilemodel.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Userprofilemodel>> getUserProfile();
}
