
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostAttachment extends StatelessWidget {
  const PostAttachment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all( 15,),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: ConstContainerDecorations.redshadow(context),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              Constants.sourceicon,
              width: 25,
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Data Warehouse',
                style: Fonts.normalbluestyle14.copyWith(
                  color: Color(ConstsColors.kred),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SvgPicture.asset(
              Constants.downloadicon,
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
