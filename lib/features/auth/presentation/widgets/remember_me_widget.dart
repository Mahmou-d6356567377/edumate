
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({
    super.key,
  });

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}
bool isChecked = false;

class _RememberMeWidgetState extends State<RememberMeWidget> {
  @override
  void initState() {
    isChecked = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          'Forgot Password?',
          style: Fonts.normalgreystyle,
        ),
      ],
    );
  }
}
