import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClassworkCategoryWidget extends StatelessWidget {
  const ClassworkCategoryWidget({super.key, required this.title, required this.pic, required this.itemno, this.onTap});
  final String title;
  final String pic;
  final String itemno;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: ConstVariebles.iconborder,
          decoration:
              Theme.of(context).brightness == Brightness.light
                  ? ConstContainerDecorations.whiteshadow(context)
                  : ConstContainerDecorations.darkmodeshadow(context),
          child: Column(
            children: [
              SizedBox.fromSize(size: const Size.fromHeight(10)),
              Padding(
                padding: ConstVariebles.iconborder,
                child: SvgPicture.asset(pic, width: 60, height: 60),
              ),
              SizedBox.fromSize(size: const Size.fromHeight(10)),
              Text(
                title,
                style:
                    Theme.of(context).brightness == Brightness.light
                        ? Fonts.normalblackstyle18
                        : Fonts.normalwhitestyle18,
              ),
              Text('$itemno items', style: Fonts.normalgreystyle16),
            ],
          ),
        ),
      ),
    );
  }
}
