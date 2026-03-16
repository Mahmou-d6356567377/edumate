import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/navigation/widgets/view_sources_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AiResponseMsgWidget extends StatelessWidget {
  const AiResponseMsgWidget({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(Constants.botmsg, width: 50, height: 50),
            SizedBox(width: 10),
            Text(
              'EDUMATE AI',
              style: Fonts.boldblackstyle18.copyWith(
                color: Color(ConstsColors.kbluegray),
              ),
            ),
          ],
        ),
        Container(
          width: width * .8,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.light
                    ? Color(ConstsColors.kwaterblue)
                    : Color(ConstsColors.kdarkbluegray),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'dssssssssssssssssssssssssssssdsssssssse44444444444wtttkjjjjjjjjjjjjjjsssssssssssdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',
                style:
                    Theme.of(context).brightness == Brightness.light
                        ? Fonts.normalblackstyle18
                        : Fonts.normalwhitestyle18,
              ),
              SizedBox(height: 15),
              ViewSourcesWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
