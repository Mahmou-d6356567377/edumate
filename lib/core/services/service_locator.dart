// lib/core/di/service_locator.dart

import 'package:dio/dio.dart';
import 'package:edumate/core/network/interceptors/logging_interceptor.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:edumate/features/auth/data/repo/auth_repo_IMPL.dart';
import 'package:edumate/features/auth/presentation/bloc/forgetpassword/forgetpassword_cubit.dart';

import 'package:edumate/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:edumate/features/auth/presentation/bloc/resetpassword/resetpassword_cubit.dart';
import 'package:edumate/features/auth/presentation/bloc/verify/verify_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(LoggingInterceptor());
  }

  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Auth
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      apiService: sl<ApiService>(),
      secureStorage: sl<FlutterSecureStorage>(),
    ),
  );
  sl.registerFactory<LoginCubit>(() => LoginCubit(authRepo: sl()));
  sl.registerFactory<VerifyCubit>(() => VerifyCubit(authRepo: sl()));
  sl.registerFactory<ForgetpasswordCubit>(
    () => ForgetpasswordCubit(authRepo: sl()),
  );
  sl.registerFactory<ResetpasswordCubit>(
    () => ResetpasswordCubit(authRepo: sl()),
  );
}
