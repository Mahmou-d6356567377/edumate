import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    this.onPressed,
    required this.verticalpadidng,
    required this.horizontalpadding,
  });
  final double verticalpadidng;
  final double horizontalpadding;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(ConstsColors.kblue),
          padding:  EdgeInsets.symmetric(vertical: verticalpadidng, horizontal: horizontalpadding),
        ),
        onPressed: onPressed,
        child: Text(
          'Submit Assignment',
          style:
              Theme.of(context).brightness == Brightness.light
                  ? Fonts.boldwhitestyle18
                  : Fonts.boldblackstyle18,
        ),
      ),
    );
  }
}
