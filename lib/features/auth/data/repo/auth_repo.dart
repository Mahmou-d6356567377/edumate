import 'package:dartz/dartz.dart';
import 'package:edumate/core/failure/failures.dart';
import 'package:edumate/features/auth/data/models/login_response_model.dart';

abstract class AuthRepo {
  Future<bool> isLoggedIn();

  Future<Either<Failure, LoginResponseModel>> login(
    String email,
    String password,
  );
  Future<Either<Failure, String>> verify(String email, String code);

  Future<Either<Failure, String>> registerStudent(
    String name,
    String email,
    String password,
  );
  Future<Either<Failure, String>> forgetPassword(String email);

  Future<Either<Failure, String>> resetpassword(
    String code,
    String email,
    String newpassword,
  );
}
