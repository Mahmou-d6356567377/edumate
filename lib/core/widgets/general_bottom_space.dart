
import 'package:flutter/material.dart';

class GeneralBottomSpace extends StatelessWidget {
  const GeneralBottomSpace({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height * 0.07);
  }
}
