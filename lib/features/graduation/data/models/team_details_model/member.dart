class Member {
  String? studentId;
  String? studentName;
  String? role;
  DateTime? joinDate;

  Member({this.studentId, this.studentName, this.role, this.joinDate});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    studentId: json['studentId'] as String?,
    studentName: json['studentName'] as String?,
    role: json['role'] as String?,
    joinDate:
        json['joinDate'] == null
            ? null
            : DateTime.parse(json['joinDate'] as String),
  );

  Map<String, dynamic> toJson() => {
    'studentId': studentId,
    'studentName': studentName,
    'role': role,
    'joinDate': joinDate?.toIso8601String(),
  };
}
