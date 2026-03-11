import 'package:edumate/features/auth/presentation/pages/forget_password.dart';
import 'package:edumate/features/auth/presentation/pages/login.dart';
import 'package:edumate/features/auth/presentation/pages/reset_password.dart';
import 'package:edumate/features/auth/presentation/pages/signup.dart';
import 'package:edumate/features/auth/presentation/pages/verification_page.dart';
import 'package:edumate/features/home/pages/home_screen.dart';
import 'package:edumate/features/in/presentation/pages/intro.dart';
import 'package:go_router/go_router.dart';

class GoRoutes {
  // paths
  static const String introPath = '/intropages';
  static const String loginPath = '/loginpage';
  static const String signupPath = '/signuppage';
  static const String forgetPasswordPath = '/forgetpasswordpage';
  static const String verificationPath = '/verificationpage';
  static const String resetPasswordPath = '/resetpasswordpage';
  static const String homescreenPath = '/homescreen';

  // names
  static const String intro = 'intro';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String forgetPassword = 'forgetPassword';
  static const String verification = 'verification';
  static const String resetPassword = 'resetPassword';
  static const String homescreen = 'home';

  static GoRouter getRouter(bool isLoggedIn, String uid) {
    return GoRouter(
      initialLocation: homescreenPath,
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
          builder: (context, state) => VerificationPage(emailcontroller: state.extra as String),
        ),
         GoRoute(
          path: resetPasswordPath,
          name: resetPassword,
          builder: (context, state) => ResetPassword(),
        ),
         GoRoute(
          path: homescreenPath,
          name: homescreen,
          builder: (context, state) => HomeScreen(),
        ),
      ],
    );
  }
}
