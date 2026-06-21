import 'package:edumate/features/courses/widgets/subject_card_shimmer.dart';
import 'package:edumate/features/graduation/cubits/getgraduationteams/getgraduationteams_cubit.dart';
import 'package:edumate/features/graduation/widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetgraduationteamsCubit, GetgraduationteamsState>(
      builder: (context, state) {
        if (state is GetgraduationteamsFailure) {
          return Center(child: Text(state.message));
        }

        if (state is GetgraduationteamsSuccess) {
          final myTeam = state.teams.myTeam;
          final discoverTeams = state.teams.discoverTeams ?? [];

          return ListView(
            key: const ValueKey('teams'),
            children: [
              if (myTeam != null) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'My Team',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TeamCard(
                  status: 'MY TEAM',
                  id: myTeam.id ?? 'No ID Provided',
                  title: myTeam.name ?? 'No Name Provided',
                  subtitle: myTeam.description ?? 'No Description Provided',
                  members: myTeam.numberOfMembers ?? 0,
                  total: myTeam.maxMembers ?? 0,
                  isRequested: false,
                  disabled: false,
                  isMyTeam: true, // 👈 hides join button
                ),
                const SizedBox(height: 16),
              ],

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Discover Teams',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              if (discoverTeams.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text(
                      'No teams to discover yet.\nCheck back later!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              else
                ...discoverTeams.map(
                  (team) => TeamCard(
                    status: 'OPEN',
                    id: team.id ?? 'No ID Provided',
                    title: team.name ?? 'No Name Provided',
                    subtitle: team.description ?? 'No Description Provided',
                    members: team.numberOfMembers ?? 0,
                    total: team.maxMembers ?? 0,
                    isRequested: false,
                  ),
                ),
            ],
          );
        }

        return const SubjectCardShimmer();
      },
    );
  }
}
