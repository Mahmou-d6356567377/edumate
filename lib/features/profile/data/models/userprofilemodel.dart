class Userprofilemodel {
  String? id;
  String? studentId;
  String? level;
  double? gpa;
  int? finishedHours;
  int? registeredHours;
  dynamic phoneNumber;
  String? userId;
  String? type;
  String? email;
  dynamic userName;
  String? fullName;

  Userprofilemodel({
    this.id,
    this.studentId,
    this.level,
    this.gpa,
    this.finishedHours,
    this.registeredHours,
    this.phoneNumber,
    this.userId,
    this.type,
    this.email,
    this.userName,
    this.fullName,
  });

  factory Userprofilemodel.fromJson(Map<String, dynamic> json) {
    return Userprofilemodel(
      id: json['id'] as String?,
      studentId: json['studentId'] as String?,
      level: json['level'] as String?,
      gpa: json['gpa'] as double?,
      finishedHours: json['finishedHours'] as int?,
      registeredHours: json['registeredHours'] as int?,
      phoneNumber: json['phoneNumber'] as dynamic,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      email: json['email'] as String?,
      userName: json['userName'] as dynamic,
      fullName: json['fullName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'studentId': studentId,
    'level': level,
    'gpa': gpa,
    'finishedHours': finishedHours,
    'registeredHours': registeredHours,
    'phoneNumber': phoneNumber,
    'userId': userId,
    'type': type,
    'email': email,
    'userName': userName,
    'fullName': fullName,
  };
}
