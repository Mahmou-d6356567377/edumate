import 'member.dart';

class TeamDetailsModel {
  String? id;
  String? name;
  String? description;
  int? maxMembers;
  int? membersCount;
  String? status;
  List<dynamic>? instructors;
  List<Member>? members;

  TeamDetailsModel({
    this.id,
    this.name,
    this.description,
    this.maxMembers,
    this.membersCount,
    this.status,
    this.instructors,
    this.members,
  });

  factory TeamDetailsModel.fromJson(Map<String, dynamic> json) {
    return TeamDetailsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      maxMembers: json['maxMembers'] as int?,
      membersCount: json['membersCount'] as int?,
      status: json['status'] as String?,
      instructors: json['instructors'] as List<dynamic>?,
      members:
          (json['members'] as List<dynamic>?)
              ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'maxMembers': maxMembers,
    'membersCount': membersCount,
    'status': status,
    'instructors': instructors,
    'members': members?.map((e) => e.toJson()).toList(),
  };
}
