import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentFileListTile extends StatelessWidget {
  const RecentFileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),

          child: SvgPicture.asset(Constants.sourceicon, width: 40, height: 40),
        ),
        subtitle: Text('www.example.com', style: Fonts.normalgreystyle),
        title: Text(
          'Source 1',
          style:
              Theme.of(context).brightness == Brightness.light
                  ? Fonts.normalblackstyle18
                  : Fonts.normalwhitestyle18,
        ),
      ),
    );
  }
}
