import 'package:edumate/config/env/vid.dart';
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/data/models/course_model/course_model1.dart';
import 'package:edumate/features/courses/data/models/subItemtosubdetailModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectItemWidget extends StatelessWidget {
  const SubjectItemWidget({
    super.key,
    required this.selected,
    required this.course,
  });

  final int selected;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          GoRoutes.subjectpagePath,
          extra: Subitemtosubdetailmodel(
            subId: course.courseId!,
            subname: course.courseName!,
            subpic: course.imageUrl!,
          ),
        );
      },

      child: Container(
        decoration:
            Theme.of(context).brightness == Brightness.light
                ? ConstContainerDecorations.whiteshadow(context)
                : ConstContainerDecorations.darkmodeshadow(context),
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${VidConsts.apiBaseURL}${course.imageUrl}', //course.imageUrl!,
              width: 70,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          title: Row(
            children: [
              Flexible(
                child: Text(
                  maxLines: 1,
                  course.courseName!,
                  style:
                      Theme.of(context).brightness == Brightness.light
                          ? Fonts.boldblackstyle18
                          : Fonts.boldwhitestyle18,
                ),
              ),
              // LectureMark(isLab: selected == 2, isLecture: selected == 1),
            ],
          ),
          titleTextStyle: Fonts.boldblackstyle18,
          subtitle: Text('DR ${course.instructorName!}'),
          subtitleTextStyle: Fonts.normalgreystyle16,
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}
