class CourseModel {
  String? courseName;
  String? courseId;
  String? instructorName;
  String? imageUrl;

  CourseModel({
    this.courseName,
    this.courseId,
    this.instructorName,
    this.imageUrl,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    courseName: json['courseName'] as String?,
    courseId: json['courseId'] as String?,
    instructorName: json['instructorName'] as String?,
    imageUrl: json['imageUrl'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'courseName': courseName,
    'courseId': courseId,
    'instructorName': instructorName,
    'imageUrl': imageUrl,
  };
}
