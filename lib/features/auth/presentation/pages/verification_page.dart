import 'package:edumate/core/fonts/fonts.dart';
import 'package:edumate/core/widgets/general_bottom_space.dart';
import 'package:edumate/core/widgets/large_auth_button.dart';
import 'package:edumate/core/widgets/otp_pin_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.emailcontroller});

  final String emailcontroller;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController pinController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
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
              GoRouter.of(context).pop();
            },
            child: Center(
              child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              Text(
                'Verification',
                style: Fonts.headingStyle,
                textAlign: TextAlign.start,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 8,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'We sent you a verification code to your email ',
                        style: Fonts.normalgreystyle,
                      ),
                      TextSpan(
                        text: widget.emailcontroller,
                        style: Fonts.normalgreystyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [OtpPinPutField(pinController: pinController, formKey: formKey, focusNode: focusNode,)],
              ),

              Spacer(),

              LargeButton(
                width: width,
                height: height,
                title: 'Continue',
                onPress: () {
                  focusNode.unfocus();
                  formKey.currentState!.validate();
                },
              ),
              GeneralBottomSpace(height: height),
            ],
          ),
        ),
      ),
    );
  }
}
