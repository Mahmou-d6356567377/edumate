
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/navigation/widgets/borderless_text_field.dart';
import 'package:flutter/material.dart';

  class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.height, required this.controller,  this.hintText = 'search',  this.icon = Icons.search,
  });

  final double height;
  final String hintText ;
  final TextEditingController controller ;
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.08,
      decoration:
          Theme.of(context).brightness == Brightness.light
              ? ConstContainerDecorations.whiteshadow(context)
              : ConstContainerDecorations.darkmodeshadow(context),
      child: Row(
        children: [
          Padding(
            padding: ConstVariebles.iconborder,
            child: Icon(
              Icons.search,
              color: Color(ConstsColors.kbluegray),
            ),
          ),
          Expanded(
            child: CustomBorderlessTextField(
              controller: TextEditingController(),
            ),
          ),
        ],
      ),
    );
  }
}
