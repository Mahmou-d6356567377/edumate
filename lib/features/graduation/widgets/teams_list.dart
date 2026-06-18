import 'package:edumate/features/graduation/widgets/team_card.dart';
import 'package:flutter/material.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const ValueKey('teams'),
      itemCount: 5,
      itemBuilder:
          (context, index) => const TeamCard(
            status: 'OPEN',
            title: 'AI-Driven Personalized Learning Path',
            subtitle: 'Predictive diagnostics using Neural network.',
            members: 4,
            total: 6,
            isRequested: false,
          ),
    );
  }
}
