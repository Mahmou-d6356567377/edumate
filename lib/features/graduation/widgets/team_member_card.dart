import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeamMemberCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final bool isLeader;
  final bool isadmin;
  final VoidCallback? onChatTap;

  const TeamMemberCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    this.isLeader = false,
    this.isadmin= false,
    this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      borderRadius: 12,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(radius: 26, backgroundImage: NetworkImage(imageUrl)),
              if (isLeader)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5A623),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star_rounded,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  role,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: onChatTap,
              child: SvgPicture.asset(isadmin?Constants.deletemember: Constants.msgpicon),
            ),
          ),
        ],
      ),
    );
  }
}
