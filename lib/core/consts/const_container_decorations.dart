import 'package:flutter/material.dart';

class ConstContainerDecorations {
  static  BoxDecoration kContainerDecorationCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

   static  BoxDecoration kContainerDecorationShadow = BoxDecoration(
    shape: BoxShape.rectangle,
     borderRadius: BorderRadius.circular(9),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}
