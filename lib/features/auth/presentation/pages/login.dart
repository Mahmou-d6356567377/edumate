import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/widgets/custom_txt_field2.dart';
import 'package:edumate/core/widgets/forget_password_text.dart';
import 'package:edumate/core/widgets/general_bottom_space.dart';
import 'package:edumate/core/widgets/large_auth_button.dart';
import 'package:edumate/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SvgPicture.asset(Constants.applogo, height: 300),
            Text(
              'Login Now',
              style: Fonts.headingStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Please Login To continue Using Our App ',
              style: Fonts.normalgreystyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.04),
            CustomTextField(
              hintText: 'Email',
              prefixIcon: Constants.email,
              controller: emailcontroller,
            ),
            CustomTextField(
              hintText: 'Password',
              prefixIcon: Constants.lockon,
              controller: passwordcontroller,
            ),
            RememberMeWidget(),
            Spacer(),
            LargeButton(
              width: width,
              height: height,
              title: 'Login',
              onPress: () {
                GoRouter.of(context).pushNamed(
                  GoRoutes.verification,
                  extra: emailcontroller.text,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account ? ', style: Fonts.normalgreystyle),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(GoRoutes.signupPath);
                  },
                  child: Text('Sign Up', style: Fonts.underlinedstyle),
                ),
              ],
            ),
            ForgetPasswordTxT(),
            GeneralBottomSpace(height: height),
          ],
        ),
      ),
    );
  }
}
