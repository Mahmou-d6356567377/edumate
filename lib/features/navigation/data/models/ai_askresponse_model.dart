class AiAskresponseModel {
  String? id;
  String? question;
  String? answer;
  DateTime? sentAt;
  List<String>? sources;

  AiAskresponseModel({
    this.id,
    this.question,
    this.answer,
    this.sentAt,
    this.sources,
  });

  factory AiAskresponseModel.fromJson(Map<String, dynamic> json) {
    return AiAskresponseModel(
      id: json['id'] as String?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      sentAt:
          json['sentAt'] == null
              ? null
              : DateTime.parse(json['sentAt'] as String),
      sources:
          json['sources'] == null
              ? null
              : List<String>.from(json['sources'] as List),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'answer': answer,
    'sentAt': sentAt?.toIso8601String(),
    'sources': sources,
  };
}
