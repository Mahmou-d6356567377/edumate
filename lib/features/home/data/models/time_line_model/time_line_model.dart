class TimeLineModel {
  String? sessionId;
  String? imageUrl;
  String? courseName;
  String? instructorName;
  String? day;
  String? startTime;
  String? endTime;
  String? type;
  String? location;

  TimeLineModel({
    this.sessionId,
    this.imageUrl,
    this.courseName,
    this.instructorName,
    this.day,
    this.startTime,
    this.endTime,
    this.type,
    this.location,
  });

  factory TimeLineModel.fromJson(Map<String, dynamic> json) => TimeLineModel(
    sessionId: json['sessionId'] as String?,
    imageUrl: json['imageUrl'] as String?,
    courseName: json['courseName'] as String?,
    instructorName: json['instructorName'] as String?,
    day: json['day'] as String?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
    type: json['type'] as String?,
    location: json['location'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'sessionId': sessionId,
    'imageUrl': imageUrl,
    'courseName': courseName,
    'instructorName': instructorName,
    'day': day,
    'startTime': startTime,
    'endTime': endTime,
    'type': type,
    'location': location,
  };
}
