import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title, value, subtitle;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.green, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
