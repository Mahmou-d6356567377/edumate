import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:flutter/material.dart';

class ThemedContainer extends StatelessWidget {
  const ThemedContainer({super.key, required this.child, this.height});
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: ConstVariebles.fullpadding10,
      padding: ConstVariebles.fullpadding10,
      decoration:
          Theme.of(context).brightness == Brightness.light
              ? ConstContainerDecorations.whiteshadow(context)
              : ConstContainerDecorations.darkmodeshadow(context),
      child:child,
    );
  }
}
