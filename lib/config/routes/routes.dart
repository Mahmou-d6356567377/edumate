

import 'package:edumate/features/auth/presentation/pages/forget_password.dart';
import 'package:edumate/features/auth/presentation/pages/login.dart';
import 'package:edumate/features/auth/presentation/pages/signup.dart';
import 'package:edumate/features/in/presentation/pages/intro.dart';
import 'package:go_router/go_router.dart';

class GoRoutes {
  static const String intropages = '/intropages';
  static const String loginpage = '/loginpage';
  static const String signuppage = '/signuppage';
  static const String forgetpasswordpage = '/forgetpasswordpage';


  static GoRouter getRouter(bool isLoggedIn , String uid) {
    return GoRouter(
      initialLocation: forgetpasswordpage,
      // initialLocation: isLoggedIn ? navbarscreen : makeaccount,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(path: intropages, builder: (context, state) => IntroPages()),
        GoRoute(path: loginpage, builder: (context, state) => Login()),
        GoRoute(path: signuppage, builder: (context, state) => Signup()),
        GoRoute(path: forgetpasswordpage, builder: (context, state) => ForgetPassword()),
            
      ],
    );
  }
}
