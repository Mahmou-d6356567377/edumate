
import 'package:edumate/features/courses/widgets/subject_item.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({
    super.key,
    required this.selected,
  });

  final int selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder:
            (context, index) => SubjectItemWidget(selected: selected),
        itemCount: 20,
      ),
    );
  }
}
