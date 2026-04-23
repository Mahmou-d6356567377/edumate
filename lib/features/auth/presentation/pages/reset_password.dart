import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/widgets/custom_txt_field2.dart';
import 'package:edumate/core/widgets/general_bottom_space.dart';
import 'package:edumate/core/widgets/large_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void initState() {
    _obscureText1 = true;
    _obscureText2 = true;
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
              controller: passcontroller,
              secure: _obscureText1,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText1 = !_obscureText1;
                  });
                },
                icon: Icon(
                  _obscureText1 ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            CustomTextField(
              hintText: 'Confirm Password',
              prefixIcon: Constants.lockon,
              controller: confirmpassController,
              secure: _obscureText2,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                },
                icon: Icon(
                  _obscureText2 ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),

            Spacer(),

            LargeButton(
              width: width,
              height: height,
              title: 'Continue',
              onPress: () {
                GoRouter.of(context).pushNamed(GoRoutes.homescreen);
              },
            ),
            GeneralBottomSpace(height: height),
          ],
        ),
      ),
    );
  }
}
