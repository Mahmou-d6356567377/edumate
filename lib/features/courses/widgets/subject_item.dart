
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/lecture_mark.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectItemWidget extends StatelessWidget {
  const SubjectItemWidget({
    super.key,
    required this.selected,
  });

  final int selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(GoRoutes.subjectpagePath);
      },

      child: Container(
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
              Text('Course 1'),
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
    );
  }
}
