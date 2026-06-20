import 'package:flutter/material.dart';

enum SupervisorStatus { active, busy, offline }

class SupervisorCard extends StatelessWidget {
  final String name;
  final String department;
  final String facultyId;
  final SupervisorStatus status;
  final VoidCallback? onChatTap;

  const SupervisorCard({
    super.key,
    required this.name,
    required this.department,
    required this.facultyId,
    this.status = SupervisorStatus.active,
    this.onChatTap,
  });

  Color get _statusColor {
    switch (status) {
      case SupervisorStatus.active:
        return const Color(0xFF22C55E);
      case SupervisorStatus.busy:
        return const Color(0xFFF59E0B);
      case SupervisorStatus.offline:
        return Colors.grey;
    }
  }

  String get _statusLabel {
    switch (status) {
      case SupervisorStatus.active:
        return 'Active';
      case SupervisorStatus.busy:
        return 'Busy';
      case SupervisorStatus.offline:
        return 'Offline';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 28, child: const Icon(Icons.person)),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color:
                        status == SupervisorStatus.active
                            ? const Color(0xFF22C55E)
                            : Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
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
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  department,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF2FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'ID: $facultyId',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF3B82F6),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _statusLabel,
                      style: TextStyle(
                        color: _statusColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onChatTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.chat_bubble_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
