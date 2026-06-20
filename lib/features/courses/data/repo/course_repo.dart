import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/courses/data/models/comment_model.dart';
import 'package:edumate/features/courses/data/models/course_model/course_model1.dart';
import 'package:edumate/features/courses/data/models/people_model/people_model.dart';
import 'package:edumate/features/courses/data/models/stream_message_model/stream_message_model.dart';

abstract class CourseRepo {
  Future<Either<Failure, List<CourseModel>>> getCourses();
  Future<Either<Failure, List<StreamMessageModel>>> getsubjectPosts({
    required String courseId,
  });
  Future<Either<Failure, List<CommentModel>>> getpostMesseges({
    required String msgId,
  });

  Future<Either<Failure, String>> addComent({
    required String messageId,
    required String content,
  });

  Future<Either<Failure, PeopleModel>> getCoursePeople({
    required String courseId,
  });
}
