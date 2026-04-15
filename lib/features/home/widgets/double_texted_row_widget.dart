import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class DoubleTextedRowWidget extends StatelessWidget {
  const DoubleTextedRowWidget({
    super.key,
    required this.title1,
    required this.title2,
    this.onTap2,
  });

  final String title1;
  final String title2;
  final void Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title1,
            style:
                Theme.of(context).brightness == Brightness.light
                    ? Fonts.boldblackstyle18
                    : Fonts.boldwhitestyle18,
          ),
          GestureDetector(
            onTap: onTap2,
            child: Text(title2, style: Fonts.normalbluestyle14),
          ),
        ],
      ),
    );
  }
}
