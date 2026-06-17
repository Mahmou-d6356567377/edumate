import 'package:bloc/bloc.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit({required this.authRepo}) : super(ResetpasswordInitial());

  AuthRepo authRepo;
  Future<void> resetPassword(
    String code,
    String email,
    String newpassword,
  ) async {
    emit(ResetpasswordLoading());
    final result = await authRepo.resetpassword(code, email, newpassword);
    result.fold(
      (failure) =>
          emit(ResetpasswordFailure(failure.message, failure.statusCode)),
      (message) => emit(ResetpasswordSuccess(message)),
    );
  }
}
