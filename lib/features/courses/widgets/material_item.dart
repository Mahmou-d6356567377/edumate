import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/themed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaterialItem extends StatelessWidget {
  const MaterialItem({super.key, required this.title, required this.pic, this.onTap});
  final String title;
  final String pic;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child:ThemedContainer(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
      ),
    );
  }
}
