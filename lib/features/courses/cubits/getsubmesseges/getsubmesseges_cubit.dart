import 'package:bloc/bloc.dart';
import 'package:edumate/features/courses/data/models/stream_message_model/stream_message_model.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';

part 'getsubmesseges_state.dart';

class GetstreammessegesCubit extends Cubit<GetstreammessegesState> {
  GetstreammessegesCubit({required this.courseRepo})
    : super(GetstreammessegesInitial());
  final CourseRepo courseRepo;

  Future<void> getStreamMessages({required String courseId}) async {
    emit(GetStreammessegesLoading());
    final result = await courseRepo.getsubjectPosts(courseId: courseId);
    result.fold(
      (l) => emit(GetStreammessegesFailure(message: l.message)),
      (r) => emit(GetStreammessegesSuccess(streamMessages: r)),
    );
  }
}
