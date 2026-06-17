import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:flutter/material.dart';

class ThemedContainer extends StatelessWidget {
  const ThemedContainer({
    super.key,
    required this.child,
    this.height,
    this.borderRadius = 25, this.padding, this.margin,
  });
  final Widget child;
  final double? height;
  final double borderRadius;
  final double? padding;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : ConstVariebles.fullpadding10,
      padding: padding != null ? EdgeInsets.all(padding!) : ConstVariebles.fullpadding10,
      decoration:
          Theme.of(context).brightness == Brightness.light
              ? ConstContainerDecorations.whiteshadow(
                context,
              ).copyWith(borderRadius: BorderRadius.circular(borderRadius))
              : ConstContainerDecorations.darkmodeshadow(
                context,
              ).copyWith(borderRadius: BorderRadius.circular(borderRadius)),
      child: child,
    );
  }
}
