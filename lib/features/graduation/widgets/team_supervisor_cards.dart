import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeamSupervisorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String specialization;
  final VoidCallback? onChatTap;

  const TeamSupervisorCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.specialization,
    this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(imageUrl, width: 56, height: 56, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 2),
                Text('Specialization: $specialization',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13)),
              ],
            ),
          ),
          if (onChatTap != null)
             Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: GestureDetector(
              onTap: onChatTap,
              child: SvgPicture.asset(Constants.msgpicon),
            ),
          ),
        ],
      ),
    );
  }
}