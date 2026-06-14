import 'package:bloc/bloc.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit({required this.authRepo}) : super(ForgetpasswordInitial());

  AuthRepo authRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetpasswordLoading());
    final result = await authRepo.forgetPassword(email);
    result.fold(
      (failure) => emit(ForgetpasswordFailure(failure.message, failure.statusCode)),
      (data) => emit(ForgetpasswordSuccess(data)),
    );
  }
}
