

import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/utils/course_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaterialItem extends StatelessWidget {
  const MaterialItem({
    super.key,
    required this.folder,
    required this.onTap,
  });

  final MaterialFolderModel folder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Keep whatever original card UI you already have — just swap the text.
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SvgPicture.asset(Constants.material, width: 60, height: 60),
              const SizedBox(height: 8),
              Text(
                folder.title,
                style: Fonts.boldblackstyle16,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${folder.fileCount} items',
                style: Fonts.normalgreystyle16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
