import 'package:bloc/bloc.dart';
import 'package:edumate/features/profile/data/models/userprofilemodel.dart';
import 'package:edumate/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  ProfileRepo profileRepo;

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.getUserProfile();
    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (userProfile) => emit(ProfileSuccess(userProfile)),
    );
  }
}
