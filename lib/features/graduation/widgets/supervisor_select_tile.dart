import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';

class SupervisorSelectTile extends StatelessWidget {
  final String name;
  final VoidCallback onSelect;
  final bool isSelected;

  const SupervisorSelectTile({
    super.key,
    required this.name,
    required this.onSelect,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      borderRadius: 8,
      padding: 8,
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person, color: Colors.grey[500], size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: Fonts.normalblackstyle14)),
          OutlinedButton(
            onPressed: onSelect,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(ConstsColors.kblue),
              side: const BorderSide(color: Color(ConstsColors.kgray)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            ),
            child: Text(isSelected ? 'Selected' : 'Select'),
          ),
        ],
      ),
    );
  }
}
