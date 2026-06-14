import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/widgets/custom_txt_field2.dart';
import 'package:edumate/core/widgets/forget_password_text.dart';
import 'package:edumate/core/widgets/general_bottom_space.dart';
import 'package:edumate/core/widgets/large_auth_button.dart';
import 'package:edumate/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:edumate/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          print('Login successful');
          GoRouter.of(
            context,
          ).pushNamed(GoRoutes.navimainscreen, );
        } else if (state is LoginFailure) {
          print(state.errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        };
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SvgPicture.asset(Constants.applogo, height: 300),
                    Text('Login Now', style: Fonts.headingStyle),
                    Text(
                      'Please Login To continue Using Our App',
                      style: Fonts.normalgreystyle16,
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
                    const RememberMeWidget(),
                    const Spacer(),
                    state is LoginLoading
                        ? const CircularProgressIndicator()
                        : LargeButton(
                          width: width,
                          height: height,
                          title: 'Login',
                          onPress: () {
                            context.read<LoginCubit>().login(
                              email: emailcontroller.text.trim(),
                              password: passwordcontroller.text.trim(),
                            );
                          },
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: Fonts.normalgreystyle16,
                        ),
                        TextButton(
                          onPressed:
                              () => GoRouter.of(
                                context,
                              ).push(GoRoutes.signupPath),
                          child: Text('Sign Up', style: Fonts.underlinedstyle),
                        ),
                      ],
                    ),
                    const ForgetPasswordTxT(),
                    GeneralBottomSpace(height: height),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
