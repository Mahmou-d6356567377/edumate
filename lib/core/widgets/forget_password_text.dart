
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordTxT extends StatelessWidget {
  const ForgetPasswordTxT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(GoRoutes.forgetPassword);
      },
      child: Text('Forget Password?', style: Fonts.underlinedstyle,textAlign: TextAlign.center,));
  }
}
