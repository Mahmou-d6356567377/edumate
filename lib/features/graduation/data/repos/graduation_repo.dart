import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/graduation/data/models/graduation_team_model/graduation_team_model.dart';
import 'package:edumate/features/graduation/data/models/instructor_model.dart';
import 'package:edumate/features/graduation/data/models/team_details_model/team_details_model.dart';

abstract class GraduationRepo {
  Future<Either<Failure, List<InstructorModel>>> getinstructors();
  Future<Either<Failure, List<InstructorModel>>> getalldoctors();
  Future<Either<Failure, GraduationTeamModel>> getGraduationTeams();
  Future<Either<Failure, TeamDetailsModel>> getTeamDetails({
    required String id,
  });
}
