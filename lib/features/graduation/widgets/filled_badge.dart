import 'package:flutter/material.dart';

class FilledBadge extends StatelessWidget {
  final int current;
  final int total;

  const FilledBadge({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$current/$total Filled',
        style: const TextStyle(
          color: Color(0xFF22C55E),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
