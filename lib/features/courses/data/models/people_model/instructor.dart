class Instructor {
  String? userId;
  String? instructorId;
  String? name;
  String? email;
  String? role;

  Instructor({
    this.userId,
    this.instructorId,
    this.name,
    this.email,
    this.role,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    userId: json['userId'] as String?,
    instructorId: json['instructorId'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'instructorId': instructorId,
    'name': name,
    'email': email,
    'role': role,
  };
}
