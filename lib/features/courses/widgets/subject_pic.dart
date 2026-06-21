import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';

class ClassPic extends StatelessWidget {
  const ClassPic({super.key, required this.pic});
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(ConstsColors.kbluegray),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: ConstVariebles.edgeInsets,
      clipBehavior: Clip.antiAlias, // clips children to the rounded corners
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          '${VidConsts.apiBaseURL}$pic',
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: const Icon(Icons.broken_image, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}