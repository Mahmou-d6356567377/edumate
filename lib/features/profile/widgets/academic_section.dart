import 'package:edumate/features/profile/widgets/state_card.dart';
import 'package:flutter/material.dart';

class AcademicSection extends StatelessWidget {
  const AcademicSection({
    super.key,
    required this.finishedhours,
    required this.gpa,
  });

  final int finishedhours;
  final num gpa;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Academic Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(
              child: StatCard(
                title: 'Current GPA',
                value: '3.8',
                subtitle: '+0.2 from last sem',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: StatCard(
                title: 'Credit Hours',
                value: '120',
                subtitle: 'Total registered',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
