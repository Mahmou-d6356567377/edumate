import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key, required this.imagePath, this.onTap,
  });
final String imagePath ;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap, 

      child: Container(
         width: 24,
         height: 24,
         margin: const EdgeInsets.all(8),
         decoration:Theme.of(context).brightness == Brightness.light ? ConstContainerDecorations.circle(context) : ConstContainerDecorations.circledarkmode(context),
         child: Center(
           child: SvgPicture.asset(imagePath, width: 20, height: 20),
         ),
       ),
    );
  }
}
