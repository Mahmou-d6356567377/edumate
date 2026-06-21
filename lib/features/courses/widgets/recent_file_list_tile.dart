// lib/features/courses/widgets/recent_file_list_tile.dart

import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/utils/course_dummy_data.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentFileListTile extends StatelessWidget {
  const RecentFileListTile({
    super.key,
    required this.file,
  });

  final RecentFileModel file;

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      borderRadius: 10,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.asset(Constants.sourceicon, width: 40, height: 40),
        ),
        title: Text(
          file.title,
          style: Theme.of(context).brightness == Brightness.light
              ? Fonts.normalblackstyle18
              : Fonts.normalwhitestyle18,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(file.url, style: Fonts.normalgreystyle16),
        trailing: Text(
          file.uploadedAt,
          style: Fonts.normalgreystyle16,
        ),
      ),
    );
  }
}
