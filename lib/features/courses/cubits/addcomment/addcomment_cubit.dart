// addcomment_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';

part 'addcomment_state.dart';

class AddcommentCubit extends Cubit<AddcommentState> {
  AddcommentCubit({required this.courseRepo}) : super(AddcommentInitial());
  final CourseRepo courseRepo;

  Future<void> addComment({
    required String messageId,
    required String content,
  }) async {
    emit(AddcommentLoading());
    final result = await courseRepo.addComent(
      messageId: messageId,
      content: content,
    );
    result.fold(
      (failure) => emit(AddcommentFailure(failure.message)),
      (message) => emit(AddcommentSuccess(message)),
    );
  }
}
