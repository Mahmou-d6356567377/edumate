
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddAndSendAttachment extends StatelessWidget {
  const AddAndSendAttachment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration:
          Theme.of(context).brightness == Brightness.light
              ? ConstContainerDecorations.whiteshadow(context)
              : ConstContainerDecorations.darkmodeshadow(context),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        leading: SvgPicture.asset(Constants.addsources),
        title: Text(
          'Share something with your class...',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Color( ConstsColors.kdarkgray)),
        ),
       trailing: SvgPicture.asset(Constants.sendicon, width: 30, height: 30),
      ),
    );
  }
}
