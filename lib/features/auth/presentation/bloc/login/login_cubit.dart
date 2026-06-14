import 'package:edumate/features/auth/data/models/login_response_model.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepo.login(email, password);
    result.fold(
      (failure) => emit(LoginFailure(failure.message, failure.statusCode)),
      (data) => emit(LoginSuccess(data)),
    );
  }
}
