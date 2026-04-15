import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/navigation/widgets/borderless_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldAndSender extends StatelessWidget {
  const CustomTextFieldAndSender({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Color(ConstsColors.kdarkbluegray),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomBorderlessTextField(controller: _controller),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(12),
              backgroundColor: Color(ConstsColors.kblue),
            ),
            child: Icon(Icons.arrow_upward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
