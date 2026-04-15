
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/post_attachment.dart';
import 'package:edumate/features/courses/widgets/post_listtile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectPostWidget extends StatelessWidget {
  const SubjectPostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration:
            Theme.of(context).brightness == Brightness.light
                ? ConstContainerDecorations.whiteshadow(context)
                : ConstContainerDecorations.darkmodeshadow(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostListTile(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                ' This is a sample post content. It can be multiple lines long and will be displayed in the post list tile.',
                maxLines: 7,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Color(ConstsColors.kdarkgray),
                ),
              ),
            ),
            PostAttachment(),
            Divider(
              color: Color(ConstsColors.koffwhite),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {GoRouter.of(context).push(GoRoutes.commentpagePath);},
                child: Text(
                  'comments',
                  style: Fonts.normalbluestyle14.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
