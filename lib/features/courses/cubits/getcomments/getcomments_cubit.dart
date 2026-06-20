import 'package:bloc/bloc.dart';
import 'package:edumate/features/courses/data/models/comment_model.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';
import 'package:meta/meta.dart';

part 'getcomments_state.dart';

class GetcommentsCubit extends Cubit<GetcommentsState> {
  GetcommentsCubit({required this.courseRepo}) : super(GetcommentsInitial());
  final CourseRepo courseRepo;

  Future<void> getComments({required String msgId}) async {
    emit(GetcommentsLoading());
    final result = await courseRepo.getpostMesseges(msgId: msgId);
    result.fold(
      (l) => emit(GetcommentsFailure(message: l.message)),
      (r) => emit(GetcommentsSuccess(comments: r)),
    );
  }
}
