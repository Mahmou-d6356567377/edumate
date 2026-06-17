class Coursemodel {
  String? name;
  String? code;
  int? creditHours;
  int? maxGrade;
  int? minGrade;

  Coursemodel({
    this.name,
    this.code,
    this.creditHours,
    this.maxGrade,
    this.minGrade,
  });

  factory Coursemodel.fromJson(Map<String, dynamic> json) => Coursemodel(
    name: json['name'] as String?,
    code: json['code'] as String?,
    creditHours: json['creditHours'] as int?,
    maxGrade: json['maxGrade'] as int?,
    minGrade: json['minGrade'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'creditHours': creditHours,
    'maxGrade': maxGrade,
    'minGrade': minGrade,
  };
}
