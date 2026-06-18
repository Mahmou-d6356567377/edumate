import 'package:edumate/core/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    required this.title,
    this.isBack = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {
            isBack ? Navigator.pop(context) : null;
          },
          child: SvgPicture.asset(Constants.arrowback, width: 36, height: 36),
        ),
      ),

      title: Text(title),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
