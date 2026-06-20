part of 'getcourses_cubit.dart';

abstract class GetcoursesState {}

class GetcoursesInitial extends GetcoursesState {}

class GetcoursesLoading extends GetcoursesState {}

class GetcoursesSuccess extends GetcoursesState {
  final List<CourseModel> courses;
  GetcoursesSuccess({required this.courses});
}

class GetcoursesFailure extends GetcoursesState {
  final String message;
  GetcoursesFailure({required this.message});
}
