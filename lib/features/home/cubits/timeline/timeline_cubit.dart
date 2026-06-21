import 'package:bloc/bloc.dart';
import 'package:edumate/features/home/data/models/time_line_model/time_line_model.dart';
import 'package:edumate/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit({required this.homeRepo}) : super(TimelineInitial());

  HomeRepo homeRepo;

  Future<void> getCourses({required String date}) async {
    emit(TimelineLoading());
    var result = await homeRepo.getCourses(date: date);
    result.fold(
      (l) => emit(TimelineFailure(message: l.message)),
      (r) => emit(TimelineSuccess(timeline: r)),
    );
  }
}
