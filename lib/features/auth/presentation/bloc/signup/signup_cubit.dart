import 'package:bloc/bloc.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> signup(String name, String email, String password) async {
    emit(SignupLoading());
    final result = await authRepo.registerStudent(name, email, password);
    result.fold(
      (failure) => emit(SignupFailure(failure.message, failure.statusCode)),
      (data) =>
          emit(SignupSuccess('Signup successful! Please verify your email.')),
    );
  }
}
