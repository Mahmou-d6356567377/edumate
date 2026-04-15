
import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
  width: 80,
  height: 30, // ✅ VERY IMPORTANT
  child: Stack(
    children: List.generate(4, (index) {
      return Positioned(
        left: index * 18,
        child: const CircleAvatar(
          radius: 12,
        ),
      );
    }),
  ),
);
  }
}
