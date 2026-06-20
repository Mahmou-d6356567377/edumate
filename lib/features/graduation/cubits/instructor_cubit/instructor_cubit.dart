import 'package:bloc/bloc.dart';
import 'package:edumate/features/graduation/data/models/instructor_model.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo.dart';
import 'package:meta/meta.dart';

part 'instructor_state.dart';

class InstructorCubit extends Cubit<InstructorState> {
  InstructorCubit({required this.graduationRepo}) : super(InstructorInitial());

  final GraduationRepo graduationRepo;

  Future<void> getinstructors() async {
    emit(InstructorLoading());
    final result = await graduationRepo.getinstructors();
    result.fold(
      (failure) => emit(InstructorFailure(message: failure.message)),
      (instructors) => emit(InstructorSuccess(instructors: instructors)),
    );
  }
}
