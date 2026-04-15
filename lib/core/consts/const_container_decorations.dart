import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';

class ConstContainerDecorations {
  // Circle container
  static BoxDecoration circle(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  static BoxDecoration circledarkmode(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Color(ConstsColors.kdarkbluegray),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  // Rectangle with shadow
  static BoxDecoration whiteshadow(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(9),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  static BoxDecoration redshadow(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20),
      color: Color(ConstsColors.klightred),
    );
  }

  static BoxDecoration blueshadow(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20),
      color: Color(ConstsColors.klightblue),
    );
  }

  static BoxDecoration greenshadow(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20),
      color: Color(ConstsColors.klightgreen),
    );
  }

  static BoxDecoration bluebordered(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20),
      color: Color(ConstsColors.klightblue),
      border: Border.all(color: Color(ConstsColors.kblue)),
    );
  }

  // Rectangle with shadow
  static BoxDecoration darkmodeshadow(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(9),
      color: Color(ConstsColors.kdarkblue),
      border: Border.all(color: Color(ConstsColors.klightbluegray)),
    );
  }
}

// Theme.of(context).brightness == Brightness.light
