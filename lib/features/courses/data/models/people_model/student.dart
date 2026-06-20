class Student {
  String? userId;
  String? studentId;
  String? name;
  String? email;

  Student({this.userId, this.studentId, this.name, this.email});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    userId: json['userId'] as String?,
    studentId: json['studentId'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'studentId': studentId,
    'name': name,
    'email': email,
  };
}
