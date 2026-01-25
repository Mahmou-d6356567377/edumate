import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/consts/conts_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fonts {
  static const String primaryFont = 'Poppins';

  static const TextStyle headingStyle = TextStyle(
    fontFamily: Constants.mainfont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle normalblackstyle = TextStyle(
    fontFamily: Constants.mainfont,
    color: Colors.black,
    fontSize: 16,
  );

  static const TextStyle normalgreystyle = TextStyle(
    fontFamily: Constants.mainfont,
    color: Color(ConstsColors.kdarkgray),
    fontSize: 16,
  );

  static const TextStyle semiboldstyle = TextStyle(
    fontFamily: Constants.mainfont,
    color: Color(ConstsColors.kwhite),
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle underlinedstyle = TextStyle(
    fontFamily: Constants.mainfont,
    color: Color(ConstsColors.klightblue),
    fontSize: 16,
    decoration: TextDecoration.underline,
  );
}
