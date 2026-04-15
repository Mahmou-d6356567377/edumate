import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssignmentDetailsWidget extends StatelessWidget {
  const AssignmentDetailsWidget({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          Theme.of(context).brightness == Brightness.dark
              ? ConstContainerDecorations.darkmodeshadow(context)
              : ConstContainerDecorations.whiteshadow(context),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: ConstContainerDecorations.blueshadow(context),
                  child: Text('Big Data', style: Fonts.normalbluestyle14),
                ),
                Text(' Oct 27, 2024'),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Chapter 2: Spark Processing',
                style:
                    Theme.of(context).brightness == Brightness.light
                        ? Fonts.boldblackstyle18
                        : Fonts.boldblackstyle18,
              ),
            ),

            Text.rich(
              TextSpan(
                children: const [
                  TextSpan(text: 'Instructions: '),
                  TextSpan(
                    text: ' Dr. Sarah Jenkins',
                    style:Fonts.boldblackstyle16,
                  ),
                ],
              ),
            ),

             Row(
               children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.calendar_month, size: 16, color: Color(ConstsColors.kdarkgray)),
                ),
                 Text.rich(
                  TextSpan(
                    children: const [
                      TextSpan(text: 'Deadline: '),
                      TextSpan(
                        text: ' Oct 27, 2024',
                        style:Fonts.normalbluestyle14,
                      ),
                    ],
                  ),
                             ),
               ],
             ),

            Divider(
              thickness: 2,
              color: Color(ConstsColors.koffwhite),
            ),

              Text(
                'This assignment introduces students to the fundamentals of big data, including its characteristics, challenges, and applications. Students will explore various big data technologies and tools, and learn how to analyze and visualize large datasets.',
                style: Theme.of(context).brightness == Brightness.light
                    ? Fonts.normalblackstyle14
                    : Fonts.normalwhitestyle14,
              ),
          ],
        ),
      ),
    );
  }
}
