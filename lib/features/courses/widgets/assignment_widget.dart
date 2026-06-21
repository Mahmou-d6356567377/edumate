// lib/features/courses/widgets/assignment_widget.dart

import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/utils/course_dummy_data.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';

class AssignmentWidget extends StatelessWidget {
  const AssignmentWidget({
    super.key,
    required this.assignment,
  });

  final AssignmentModel assignment;

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      borderRadius: 12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(ConstsColors.kblue).withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.assignment_outlined,
                color: Color(ConstsColors.kblue),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),

            // Title + due date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assignment.title,
                    style: Fonts.boldblackstyle16,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(assignment.dueDate, style: Fonts.normalgreystyle16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Details >',
                        style: TextStyle(color: Color(ConstsColors.kblue)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tag chip
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                assignment.tag,
                style: Fonts.normalgreystyle16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
