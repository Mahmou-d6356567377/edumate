import 'instructor.dart';
import 'student.dart';

class PeopleModel {
  List<Instructor>? instructors;
  List<Student>? students;

  PeopleModel({this.instructors, this.students});

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
    instructors:
        (json['instructors'] as List<dynamic>?)
            ?.map((e) => Instructor.fromJson(e as Map<String, dynamic>))
            .toList(),
    students:
        (json['students'] as List<dynamic>?)
            ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'instructors': instructors?.map((e) => e.toJson()).toList(),
    'students': students?.map((e) => e.toJson()).toList(),
  };
}
