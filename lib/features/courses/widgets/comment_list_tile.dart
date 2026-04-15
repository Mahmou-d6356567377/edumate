import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration:
          Theme.of(context).brightness == Brightness.light
              ? ConstContainerDecorations.bluebordered(context)
              : ConstContainerDecorations.darkmodeshadow(context),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(
            Constants.person,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Essam mossad',
              style:
                  Theme.of(context).brightness == Brightness.light
                      ? Fonts.boldblackstyle18
                      : Fonts.boldwhitestyle18,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(Constants.approvalmark, width: 20, height: 20),
          ],
        ),
        subtitle: Text(
          'Please make sure to bring your laptops for the next lab session as we will be starting the Hadoop configuration.',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Color(ConstsColors.kdarkgray),
          ),
        ),
      ),
    );
  }
}
