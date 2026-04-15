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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => AssignmentWidget(
          height: height,
          title: 'Assignment 4: create database',
          subtitle: 'Due: Oct15, 11:59 PM',
          listno: selectedList,
        ),
        childCount: 10,
      ),
    );
  }
}
