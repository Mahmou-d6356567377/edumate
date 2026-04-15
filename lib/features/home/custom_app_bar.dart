import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack ;
 final List<Widget>? actions;
  const CustomAppBar({super.key, required this.title,  this.isBack = true, this.actions });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff3572EF),
              ),
              onPressed: () {
               isBack ? Navigator.pop(context) : null;
              },
            ),
      title: Text(title),
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}