import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/fonts/fonts.dart';
import 'package:edumate/core/widgets/custom_txt_field2.dart';
import 'package:edumate/core/widgets/general_bottom_space.dart';
import 'package:edumate/core/widgets/large_auth_button.dart';
import 'package:edumate/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});



  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
TextEditingController namecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SvgPicture.asset(Constants.applogo, height: 300),
            Text(
              'Sign Up Now',
              style: Fonts.headingStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Please fill the details and create account  ',
              style: Fonts.normalgreystyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.04),
            CustomTextField(hintText: 'Full Name', prefixIcon: Constants.user, controller: namecontroller),
            CustomTextField(hintText: 'Email', prefixIcon: Constants.email, controller: emailcontroller),
            CustomTextField(hintText: 'Password', prefixIcon: Constants.lockon, controller: passwordcontroller),
            RememberMeWidget(),

            Spacer(),
            LargeButton(width: width, height: height, title: 'Sign Up', onPress: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: Fonts.normalgreystyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: Fonts.underlinedstyle,
                  ),
                ),
              ],
            ),
           GeneralBottomSpace(height: height),
          ],
        ),
      ),
    );
  }
}
