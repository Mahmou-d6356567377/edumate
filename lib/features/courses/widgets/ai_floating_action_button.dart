
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AIFloatingActionButton extends StatelessWidget {
  const AIFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 25,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(GoRoutes.aipagePath);
        },
    
        child: SvgPicture.asset(Constants.ai, width: 70, height: 70),
      ),
    );
  }
}
