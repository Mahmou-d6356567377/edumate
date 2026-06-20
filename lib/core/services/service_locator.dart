import 'package:dio/dio.dart';
import 'package:edumate/core/network/interceptors/logging_interceptor.dart';
import 'package:edumate/core/network/interceptors/refresh_token_interceptor.dart';
import 'package:edumate/core/services/api_service.dart';
import 'package:edumate/features/attendence/cubit/attendance_cubit_cubit.dart';
import 'package:edumate/features/attendence/data/repo/attendence_repo.dart';
import 'package:edumate/features/attendence/data/repo/attendence_repo_IMPL.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:edumate/features/auth/data/repo/auth_repo_IMPL.dart';
import 'package:edumate/features/auth/presentation/bloc/forgetpassword/forgetpassword_cubit.dart';
import 'package:edumate/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:edumate/features/auth/presentation/bloc/resetpassword/resetpassword_cubit.dart';
import 'package:edumate/features/auth/presentation/bloc/verify/verify_cubit.dart';
import 'package:edumate/features/courses/cubits/addcomment/addcomment_cubit.dart';
import 'package:edumate/features/courses/cubits/getcomments/getcomments_cubit.dart';
import 'package:edumate/features/courses/cubits/getcourses/getcourses_cubit.dart';
import 'package:edumate/features/courses/cubits/getsubmesseges/getsubmesseges_cubit.dart';
import 'package:edumate/features/courses/cubits/streampeople/streampeople_cubit.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';
import 'package:edumate/features/courses/data/repo/course_repo_IMPL.dart';
import 'package:edumate/features/graduation/cubits/doctor_cubit/doctor_cubit.dart';
import 'package:edumate/features/graduation/cubits/instructor_cubit/instructor_cubit.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo.dart';
import 'package:edumate/features/graduation/data/repos/graduation_repo_IMPL.dart';
import 'package:edumate/features/navigation/cubits/addchat/addchat_cubit.dart';
import 'package:edumate/features/navigation/cubits/askai/askai_cubit.dart';
import 'package:edumate/features/navigation/cubits/getallchats/getallchats_cubit.dart';
import 'package:edumate/features/navigation/data/repo/ai_repo.dart';
import 'package:edumate/features/navigation/data/repo/ai_repo_IMPL.dart';
import 'package:edumate/features/profile/data/cubits/profile/profile_cubit.dart';
import 'package:edumate/features/profile/data/repo/profile_repo.dart';
import 'package:edumate/features/profile/data/repo/profile_repo_IMPL.dart';
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
  final secureStorage = const FlutterSecureStorage();

  if (kDebugMode) {
    dio.interceptors.add(LoggingInterceptor());
  }

  dio.interceptors.add(
    RefreshTokenInterceptor(dio: dio, secureStorage: secureStorage),
  );
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

  sl.registerLazySingleton<ProfileRepo>(
    () => UserProfileRepoImpl(
      apiService: sl<ApiService>(),
      secureStorage: sl<FlutterSecureStorage>(),
    ),
  );

  sl.registerLazySingleton<AttendenceRepo>(
    () => AttendenceRepoImpl(sl<ApiService>(), sl<FlutterSecureStorage>()),
  );

  sl.registerFactory<ProfileCubit>(() => ProfileCubit(profileRepo: sl()));
  sl.registerFactory<AttendanceCubit>(
    () => AttendanceCubit(attendenceRepo: sl()),
  );

  sl.registerLazySingleton<AiRepo>(
    () => AiRepoImpl(sl<ApiService>(), sl<FlutterSecureStorage>()),
  );

  sl.registerFactory<AddChatCubit>(() => AddChatCubit(aiRepo: sl()));
  sl.registerFactory<GetAllChatsCubit>(() => GetAllChatsCubit(aiRepo: sl()));
  sl.registerFactory<AskAICubit>(() => AskAICubit(aiRepo: sl()));

  sl.registerLazySingleton<GraduationRepo>(
    () => GraduationRepoImpl(sl<ApiService>(), sl<FlutterSecureStorage>()),
  );

  sl.registerFactory<InstructorCubit>(
    () => InstructorCubit(graduationRepo: sl()),
  );
  sl.registerFactory<DoctorCubit>(() => DoctorCubit(graduationRepo: sl()));

  CourseRepoImpl(
    apiService: sl<ApiService>(),
    secureStorage: sl<FlutterSecureStorage>(),
  );
  sl.registerLazySingleton<CourseRepo>(
    () => CourseRepoImpl(
      apiService: sl<ApiService>(),
      secureStorage: sl<FlutterSecureStorage>(),
    ),
  );
  sl.registerFactory<GetcoursesCubit>(() => GetcoursesCubit(courseRepo: sl()));
  sl.registerFactory<GetcommentsCubit>(
    () => GetcommentsCubit(courseRepo: sl()),
  );
  sl.registerFactory<AddcommentCubit>(() => AddcommentCubit(courseRepo: sl()));
  sl.registerFactory<GetstreammessegesCubit>(() => GetstreammessegesCubit(courseRepo: sl()));
  sl.registerFactory<StreampeopleCubit>(() => StreampeopleCubit(courseRepo: sl()));
}
