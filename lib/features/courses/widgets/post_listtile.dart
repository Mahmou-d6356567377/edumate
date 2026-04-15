
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Image.asset(Constants.person, width: 40, height: 40,fit: BoxFit.cover)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Essam mossad',
            style: Theme.of(context).brightness == Brightness.light ? Fonts.boldblackstyle18 : Fonts.boldwhitestyle18,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(Constants.approvalmark, width: 20, height: 20),
        ],
      ),
      subtitle: Text(
        'Jan 15, 2025',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Color( ConstsColors.kdarkgray)),
      ),
    );
  }
}
