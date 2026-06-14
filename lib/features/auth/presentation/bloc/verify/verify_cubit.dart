import 'package:bloc/bloc.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit({required this.authRepo}) : super(VerifyInitial()); // ← curly braces
final AuthRepo authRepo;
  Future<void> verify({required String email, required String code}) async {
    emit(VerifyLoading());
    final result = await authRepo.verify(email, code);
    result.fold(
      (failure) => emit(VerifyFailure(failure.message, failure.statusCode)),
      (data) => emit(VerifySuccess(data)),
    );
  }
  
}
