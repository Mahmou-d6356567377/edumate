// lib/features/courses/widgets/assigment_list.dart

import 'package:edumate/core/utils/course_dummy_data.dart';
import 'package:edumate/features/courses/widgets/assignment_widget.dart';
import 'package:flutter/material.dart';

class AssignmentList extends StatelessWidget {
  const AssignmentList({
    super.key,
    required this.height,
    required this.selectedList,
  });

  final double height;
  final int selectedList;

  @override
  Widget build(BuildContext context) {
    final items = CourseDummyData.assignmentsFor(selectedList);

    if (items.isEmpty) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: height * 0.4,
          child: const Center(
            child: Text(
              'No assignments here 🎉',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => AssignmentWidget(assignment: items[index]),
        childCount: items.length,
      ),
    );
  }
}
