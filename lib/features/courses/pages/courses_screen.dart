import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/lecture_mark.dart';
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

            Expanded(
              child: ListView.builder(
                itemBuilder:
                    (context, index) => Container(
                      decoration:
                          Theme.of(context).brightness == Brightness.light
                              ? ConstContainerDecorations.whiteshadow(context)
                              : ConstContainerDecorations.darkmodeshadow(
                                context,
                              ),
                      height: 70,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5,
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            Constants.classpic,
                            width: 70,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Row(
                          children: [
                            Text('Course ${index + 1}'),
                            LectureMark(
                              isLab: selected == 2,
                              isLecture: selected == 1,
                            ),
                          ],
                        ),
                        titleTextStyle: Fonts.boldblackstyle18,
                        subtitle: Text('Course description goes here'),
                        subtitleTextStyle: Fonts.normalgreystyle,
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
