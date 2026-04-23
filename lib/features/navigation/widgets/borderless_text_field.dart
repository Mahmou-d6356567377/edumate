
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class CustomBorderlessTextField extends StatelessWidget {
  const CustomBorderlessTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Ask about your lectures...',
        hintStyle: Fonts.normalgreystyle16,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
