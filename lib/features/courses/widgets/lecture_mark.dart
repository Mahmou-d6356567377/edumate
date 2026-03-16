import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';

class LectureMark extends StatelessWidget {
  const LectureMark({super.key, required this.isLab, required this.isLecture});
  final bool isLab;
  final bool isLecture;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(
          isLecture
              ? ConstsColors.klightgreen
              : isLab
              ? ConstsColors.klightblue
              : ConstsColors.klightred,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        isLecture
            ? 'Lecture'
            : isLab
            ? 'Lab'
            : 'Task',
        style: TextStyle(
          color: Color(
            isLecture
                ? ConstsColors.kgreen
                : isLab
                ? ConstsColors.kblue
                : ConstsColors.kred,
          ),
          fontSize: 12,
        ),
      ),
    );
  }
}
