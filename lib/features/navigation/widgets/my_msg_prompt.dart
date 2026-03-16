import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class MyMsgPromptWidget extends StatelessWidget {
  const MyMsgPromptWidget({
    super.key,
    required this.width,
    required this.title,
  });

  final double width;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width * .7,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.light
                    ? Color(ConstsColors.kwaterblue)
                    : Color(ConstsColors.kdarkbluegray),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
           style:  Theme.of(context).brightness == Brightness.light
                ? Fonts.normalblackstyle18
                : Fonts.normalwhitestyle18,
          ),
        ),
      ],
    );
  }
}
