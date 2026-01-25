import 'package:flutter/material.dart';

class CircluerImgWidget extends StatelessWidget {
  const CircluerImgWidget({
    super.key, required this.img,required this.radius,
  });
  final String img;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.9),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(-1, 1),
                ),
              ]),
          child:  CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(img),
          ),
        ),
      ],
    );
  }
}
