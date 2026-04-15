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
  final List<String> categories = ['All', 'Lectures', 'Labs'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Courses'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Row(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ChoiceChip(
                    label: Text(categories[index]),
                    selected: selected == index,
                    selectedColor: Color(ConstsColors.kblue),
                    labelStyle: TextStyle(
                      color: selected == index ? Colors.white : Colors.grey,
                    ),
                    //  clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Colors.transparent),
                    onSelected: (value) {
                      setState(() {
                        selected = index;
                      });
                    },
                  ),
                ),
              ),
            ),

            SubjectList(selected: selected),
          ],
        ),
      ),
    );
  }
}