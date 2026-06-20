class InstructorModel {
  String? userId;
  String? instuctorId;
  String? fullName;
  String? email;

  InstructorModel({this.userId, this.instuctorId, this.fullName, this.email});

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      userId: json['userId'] as String?,
      instuctorId: json['instuctorId'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'instuctorId': instuctorId,
    'fullName': fullName,
    'email': email,
  };
}
