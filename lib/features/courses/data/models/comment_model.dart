class CommentModel {
  String? id;
  String? name;
  String? commentText;
  String? userId;
  String? messageId;
  DateTime? sentAt;

  CommentModel({
    this.id,
    this.name,
    this.commentText,
    this.userId,
    this.messageId,
    this.sentAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json['id'] as String?,
    name: json['name'] as String?,
    commentText: json['commentText'] as String?,
    userId: json['userId'] as String?,
    messageId: json['messageId'] as String?,
    sentAt:
        json['sentAt'] == null
            ? null
            : DateTime.parse(json['sentAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'commentText': commentText,
    'userId': userId,
    'messageId': messageId,
    'sentAt': sentAt?.toIso8601String(),
  };
}
