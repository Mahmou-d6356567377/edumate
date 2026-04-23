import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/widgets/custom_txt_field2.dart';
import 'package:edumate/core/widgets/general_bottom_space.dart';
import 'package:edumate/core/widgets/large_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  bool _obscureText1 = true;
  @override
  void initState() {
    _obscureText1 = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 4,
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              padding: EdgeInsets.all(8),
            ),
            onPressed: () {
              context.pop();
            },
            child: Center(
              child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
            Text(
              'Forget Password?',
              style: Fonts.headingStyle,
              textAlign: TextAlign.start,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 8,
              ),
              child: Text(
                'Fill in your email and we’ll send a code to rest your password.',
                style: Fonts.normalgreystyle16,
              ),
            ),

            CustomTextField(
              hintText: 'New Password',
              prefixIcon: Constants.lockon,
              suffixIcon: IconButton(onPressed: () {setState(() {
                _obscureText1 = !_obscureText1;
              });}, icon: Icon( _obscureText1 ? Icons.visibility : Icons.visibility_off)),
              controller: newpasscontroller,
            ),

            Spacer(),

            LargeButton(
              width: width,
              height: height,
              title: 'Continue',
              onPress: () {
                GoRouter.of(context).push(GoRoutes.verificationPath, extra: newpasscontroller.text);
              },
            ),
            GeneralBottomSpace(height: height),
          ],
        ),
      ),
    );
  }
}
