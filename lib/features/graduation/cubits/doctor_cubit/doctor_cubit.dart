import 'package:bloc/bloc.dart';
import 'package:edumate/features/graduation/data/models/instructor_model.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit({required this.graduationRepo}) : super(DoctorInitial());
  final GraduationRepo graduationRepo;

  Future<void> getdoctors() async {
    emit(DoctorLoading());
    final result = await graduationRepo.getalldoctors();
    result.fold(
      (failure) => emit(DoctorFailure(message: failure.message)),
      (instructors) => emit(DoctorSuccess(doctors: instructors)),
    );
  }
}
