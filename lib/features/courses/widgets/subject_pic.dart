
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';

class ClassPic extends StatelessWidget {
  const ClassPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(ConstsColors.kbluegray),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: ConstVariebles.edgeInsets,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [Image.asset(Constants.classpic1, fit: BoxFit.cover)],
      ),
    );
  }
}
