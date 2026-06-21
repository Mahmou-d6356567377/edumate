import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/home/data/models/time_line_model/time_line_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TimeLineModel>>> getCourses({required String date});
}
