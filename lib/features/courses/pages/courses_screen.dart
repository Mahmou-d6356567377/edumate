import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/courses/widgets/subjects_list.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int selected = 0;
  final List<String> categories = [
    'All',
    //'Lectures', 'Labs',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Courses', isBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            SubjectList(selected: selected),
          ],
        ),
      ),
    );
  }
}
