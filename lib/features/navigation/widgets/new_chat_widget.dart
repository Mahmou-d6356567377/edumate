
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNewChat extends StatelessWidget {
  const CustomNewChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle new chat creation
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(Constants.newchat),
          ),
          Text(
            'NewChats',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Color(ConstsColors.kblue),
            ),
          ),
        ],
      ),
    );
  }
}
