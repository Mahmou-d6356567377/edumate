import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/services/service_locator.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WelcomeNameText extends StatelessWidget {
  const WelcomeNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: sl<FlutterSecureStorage>().read(key: VidConsts.name),
      builder: (context, snapshot) {
        final name = snapshot.data ?? 'Student';
        return Text(
          '$name! 👋',
          style:
              Theme.of(context).brightness == Brightness.light
                  ? Fonts.headingStyle
                  : Fonts.headingStyleDark,
        );
      },
    );
  }
}
