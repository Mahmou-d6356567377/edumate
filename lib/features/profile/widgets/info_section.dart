import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ThemedContainer(
          child: Column(children: children),
        ),
      ],
    );
  }
}
