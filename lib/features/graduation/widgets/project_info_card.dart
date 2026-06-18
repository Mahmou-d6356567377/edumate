import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';

class ProjectInfoCard extends StatelessWidget {
  final String status;
  final int membersCount;
  final int totalMembers;
  final String title;
  final String description;

  const ProjectInfoCard({
    super.key,
    required this.status,
    required this.membersCount,
    required this.totalMembers,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      borderRadius: 12,
      padding: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Color(ConstsColors.kgreenshadow),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Color(ConstsColors.kdarkgreen),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                '$membersCount/$totalMembers members',
                style: TextStyle(color: Colors.grey[500], fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'ABOUT THE PROJECT',
            style: Fonts.normalbluestyle12.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Fonts.normalgreystyle14.copyWith(
              color: Color(ConstsColors.kdarkgray2),
              height: 1.5,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
