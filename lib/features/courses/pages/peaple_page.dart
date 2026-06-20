import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/features/courses/widgets/subject_member_item.dart';
import 'package:edumate/features/home/widgets/double_texted_row_widget.dart';
import 'package:flutter/material.dart';

class PeaplePage extends StatelessWidget {
  const PeaplePage({super.key, required this.subjectid});
  final String subjectid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstVariebles.fullpadding16,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DoubleTextedRowWidget(
              title1: 'Intstructors',
              title2: '2 Members',
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => SubjectMemberItem(),
            itemCount: 3,
          ),
          SliverToBoxAdapter(
            child: DoubleTextedRowWidget(
              title1: 'Students',
              title2: '148 classmates',
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => SubjectMemberItem(),
            itemCount: 19,
          ),
        ],
      ),
    );
  }
}
