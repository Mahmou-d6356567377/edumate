class MyTeam {
  String? id;
  String? name;
  String? description;
  int? numberOfMembers;
  int? maxMembers;

  MyTeam({
    this.id,
    this.name,
    this.description,
    this.numberOfMembers,
    this.maxMembers,
  });

  factory MyTeam.fromJson(Map<String, dynamic> json) => MyTeam(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    numberOfMembers: json['numberOfMembers'] as int?,
    maxMembers: json['maxMembers'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'numberOfMembers': numberOfMembers,
    'maxMembers': maxMembers,
  };
}
