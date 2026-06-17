
import 'package:edumate/features/graduation/widgets/superviser_card.dart';
import 'package:flutter/material.dart';

class SuperviserList extends StatelessWidget {
  const SuperviserList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const ValueKey('supervisors'),
      itemCount: 3,
      itemBuilder: (context, index) => SupervisorCard(
        imageUrl: 'https://i.pravatar.cc/150?img=$index', // placeholder
        name: 'Dr. Sarah James',
        department: 'Arts & Humanities',
        facultyId: 'FAC-334',
        status: SupervisorStatus.active,
        onChatTap: () {
          // navigate to chat or open a dialog
        },
      ),
    );
  }
}