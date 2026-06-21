class DiscoverTeam {
  String? id;
  String? name;
  String? description;
  int? numberOfMembers;
  int? maxMembers;
  String? requestId;

  DiscoverTeam({
    this.id,
    this.name,
    this.description,
    this.numberOfMembers,
    this.maxMembers,
    this.requestId,
  });

  factory DiscoverTeam.fromJson(Map<String, dynamic> json) => DiscoverTeam(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    numberOfMembers: json['numberOfMembers'] as int?,
    maxMembers: json['maxMembers'] as int?,
    requestId: json['requestId'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'numberOfMembers': numberOfMembers,
    'maxMembers': maxMembers,
    'requestId': requestId,
  };
}
