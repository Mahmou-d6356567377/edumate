import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;


  const CustomAppBar({
    super.key,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff3572EF),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}