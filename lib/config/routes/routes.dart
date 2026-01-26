import 'package:edumate/features/auth/presentation/pages/forget_password.dart';
import 'package:edumate/features/auth/presentation/pages/login.dart';
import 'package:edumate/features/auth/presentation/pages/signup.dart';
import 'package:edumate/features/auth/presentation/pages/verification_page.dart';
import 'package:edumate/features/in/presentation/pages/intro.dart';
import 'package:go_router/go_router.dart';

class GoRoutes {
  // paths
  static const String introPath = '/intropages';
  static const String loginPath = '/loginpage';
  static const String signupPath = '/signuppage';
  static const String forgetPasswordPath = '/forgetpasswordpage';
  static const String verificationPath = '/verificationpage';

  // names
  static const String intro = 'intro';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String forgetPassword = 'forgetPassword';
  static const String verification = 'verification';

  static GoRouter getRouter(bool isLoggedIn, String uid) {
    return GoRouter(
      initialLocation: loginPath,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: introPath,
          name: intro,
          builder: (context, state) => IntroPages(),
        ),
        GoRoute(
          path: loginPath,
          name: login,
          builder: (context, state) => Login(),
        ),
        GoRoute(
          path: signupPath,
          name: signup,
          builder: (context, state) => Signup(),
        ),
        GoRoute(
          path: forgetPasswordPath,
          name: forgetPassword,
          builder: (context, state) => ForgetPassword(),
        ),
        GoRoute(
          path: verificationPath,
          name: verification,
          builder:
              (context, state) =>
                  VerificationPage(emailcontroller: state.extra as String),
        ),
      ],
    );
  }
}
