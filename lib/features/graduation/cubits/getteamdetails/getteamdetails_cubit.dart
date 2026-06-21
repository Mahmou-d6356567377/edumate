import 'package:bloc/bloc.dart';
import 'package:edumate/features/graduation/data/models/team_details_model/team_details_model.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo.dart';
import 'package:meta/meta.dart';

part 'getteamdetails_state.dart';

class GetteamdetailsCubit extends Cubit<GetteamdetailsState> {
  GetteamdetailsCubit({required this.graduationRepo})
    : super(GetteamdetailsInitial());
  final GraduationRepo graduationRepo;

  Future<void> getteamdetails({required String id}) async {
    emit(GetteamdetailsLoading());
    final result = await graduationRepo.getTeamDetails(id: id);
    result.fold(
      (failure) => emit(GetteamdetailsFailure(message: failure.message)),
      (teamdetails) => emit(GetteamdetailsSuccess(teamDetails: teamdetails)),
    );
  }
}
