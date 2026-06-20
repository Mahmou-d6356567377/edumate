import 'package:bloc/bloc.dart';
import 'package:edumate/features/courses/data/models/people_model/people_model.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';
import 'package:meta/meta.dart';

part 'streampeople_state.dart';

class StreampeopleCubit extends Cubit<StreampeopleState> {
  StreampeopleCubit({required this.courseRepo}) : super(StreampeopleInitial());
 final CourseRepo courseRepo;
  Future<void> getStreamPeople({required String courseId}) async {
    emit(StreampeopleLoading());
    final result = await courseRepo.getCoursePeople(courseId: courseId);
    result.fold(
      (failure) => emit(StreampeopleFailure(failure.message)),
      (people) => emit(StreampeopleSuccess(users:people)),
    );
  }
  
}
