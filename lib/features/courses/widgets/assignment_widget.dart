import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AssignmentWidget extends StatelessWidget {
  const AssignmentWidget({
    super.key,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.listno,
  });

  final double height;
  final String title;
  final String subtitle;
  final int listno;

  @override
  Widget build(BuildContext context) {
    List<String> lists = ConstVariebles.choicechipsassignmentList;
    List<BoxDecoration> containercolor = [
      ConstContainerDecorations.blueshadow(context),
      ConstContainerDecorations.greenshadow(context),
      ConstContainerDecorations.redshadow(context),
      ConstContainerDecorations.greenshadow(context),
    ];

    List<TextStyle> fonts = [
      Fonts.normalbluestyle14,
      Fonts.normalgreenstyle14,
      Fonts.normalredstyle14,
      Fonts.normalgreenstyle14,
    ];

    List<String> pics = [
      Constants.file,
      Constants.checkicon,
      Constants.erroricon,
      Constants.checkicon,
    ];

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(GoRoutes.assignmentdetailspagePath);
      },

      child: ThemedContainer(
        height: height * 0.2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: containercolor[listno],
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(pics[listno], width: 30, height: 30),
                ),
                Container(
                  decoration: containercolor[listno],
                  padding: const EdgeInsets.all(10),
                  child: Text(lists[listno], style: fonts[listno]),
                ),
              ],
            ),

            ListTile(
              title: Text(
                title,
                style:
                    Theme.of(context).brightness == Brightness.light
                        ? Fonts.boldblackstyle18
                        : Fonts.boldwhitestyle18,
              ),
              subtitle: Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Color(ConstsColors.kdarkgray),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text('Details >', style: fonts[listno]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
