import 'package:bloc/bloc.dart';
import 'package:edumate/features/courses/data/models/course_model/course_model1.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';

part 'getcourses_state.dart';

class GetcoursesCubit extends Cubit<GetcoursesState> {
  GetcoursesCubit({required this.courseRepo}) : super(GetcoursesInitial());
  final CourseRepo courseRepo;

  Future<void> getCourses() async {
    emit(GetcoursesLoading());
    final result = await courseRepo.getCourses();
    result.fold(
      (l) => emit(GetcoursesFailure(message: l.message)),
      (r) => emit(GetcoursesSuccess(courses: r)),
    );
  }
}
