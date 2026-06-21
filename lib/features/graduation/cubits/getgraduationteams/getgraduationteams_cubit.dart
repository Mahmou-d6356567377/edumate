import 'package:bloc/bloc.dart';
import 'package:edumate/features/graduation/data/models/graduation_team_model/graduation_team_model.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo.dart';
import 'package:meta/meta.dart';

part 'getgraduationteams_state.dart';

class GetgraduationteamsCubit extends Cubit<GetgraduationteamsState> {
  GetgraduationteamsCubit({required this.graduationRepo})
    : super(GetgraduationteamsInitial());
  final GraduationRepo graduationRepo;

  Future<void> getgraduationteams() async {
    emit(GetgraduationteamsLoading());
    final result = await graduationRepo.getGraduationTeams();
    result.fold(
      (failure) => emit(GetgraduationteamsFailure(message: failure.message)),
      (teams) => emit(GetgraduationteamsSuccess(teams: teams)),
    );
  }
}
