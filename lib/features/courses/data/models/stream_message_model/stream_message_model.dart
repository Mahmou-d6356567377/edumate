class StreamMessageModel {
  String? id;
  String? name;
  String? title;
  String? content;
  String? courseId;
  String? userId;
  DateTime? createdAt;
  String? fileUrl;
  String? fileName;
  int? numberOfComment;

  StreamMessageModel({
    this.id,
    this.name,
    this.title,
    this.content,
    this.courseId,
    this.userId,
    this.createdAt,
    this.fileUrl,
    this.fileName,
    this.numberOfComment,
  });

  factory StreamMessageModel.fromJson(Map<String, dynamic> json) {
    return StreamMessageModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      courseId: json['courseId'] as String?,
      userId: json['userId'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      fileUrl: json['fileUrl'] as String?,
      fileName: json['fileName'] as String?,
      numberOfComment: json['numberOfComment'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'title': title,
    'content': content,
    'courseId': courseId,
    'userId': userId,
    'createdAt': createdAt?.toIso8601String(),
    'fileUrl': fileUrl,
    'fileName': fileName,
    'numberOfComment': numberOfComment,
  };
}
