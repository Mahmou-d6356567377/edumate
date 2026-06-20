class AiChatsItemModel {
  String? id;
  String? name;
  DateTime? createdAt;

  AiChatsItemModel({this.id, this.name, this.createdAt});

  factory AiChatsItemModel.fromJson(Map<String, dynamic> json) {
    return AiChatsItemModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt?.toIso8601String(),
  };
}
