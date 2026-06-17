import 'package:flutter/material.dart';

class EditableMemberTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final bool isLeader;
  final VoidCallback? onRemove;

  const EditableMemberTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    this.isLeader = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(role, style: TextStyle(color: isLeader ? const Color(0xFF3B82F6) : Colors.grey[500], fontSize: 12)),
              ],
            ),
          ),
          if (isLeader)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xFFE8F5E9), shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Color(0xFF22C55E), size: 14),
            )
          else
            GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Color(0xFFFDEDED), shape: BoxShape.circle),
                child: const Icon(Icons.person_remove_rounded, color: Color(0xFFE53935), size: 14),
              ),
            ),
        ],
      ),
    );
  }
}