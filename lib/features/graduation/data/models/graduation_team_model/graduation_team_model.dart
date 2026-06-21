import 'discover_team.dart';
import 'my_team.dart';

class GraduationTeamModel {
  MyTeam? myTeam;
  List<DiscoverTeam>? discoverTeams;

  GraduationTeamModel({this.myTeam, this.discoverTeams});

  factory GraduationTeamModel.fromJson(Map<String, dynamic> json) {
    return GraduationTeamModel(
      myTeam:
          json['myTeam'] == null
              ? null
              : MyTeam.fromJson(json['myTeam'] as Map<String, dynamic>),
      discoverTeams:
          (json['discoverTeams'] as List<dynamic>?)
              ?.map((e) => DiscoverTeam.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'myTeam': myTeam?.toJson(),
    'discoverTeams': discoverTeams?.map((e) => e.toJson()).toList(),
  };
}
