import 'package:edumate/core/consts/conts_colors.dart';
import 'package:edumate/core/fonts/fonts.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({super.key, required this.width, required this.height, required this.title, this.onPress});

  final double width;
  final double height;
  final void Function()? onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.9,
      height: height * 0.06,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(ConstsColors.klightblue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(title, style: Fonts.semiboldstyle),
      ),
    );
  }
}
