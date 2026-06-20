import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/graduation/data/models/instructor_model.dart';

abstract class GraduationRepo {
  Future<Either<Failure, List<InstructorModel>>> getinstructors();
}
