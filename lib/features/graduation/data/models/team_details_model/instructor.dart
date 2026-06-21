class Instructor {
  String? id;
  String? name;
  String? role;

  Instructor({this.id, this.name, this.role});

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json['id'] as String?,
    name: json['name'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'role': role};
}
