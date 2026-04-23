import 'package:edumate/features/auth/presentation/pages/forget_password.dart';
import 'package:edumate/features/auth/presentation/pages/login.dart';
import 'package:edumate/features/auth/presentation/pages/reset_password.dart';
import 'package:edumate/features/auth/presentation/pages/signup.dart';
import 'package:edumate/features/auth/presentation/pages/verification_page.dart';
import 'package:edumate/features/courses/pages/assignment_details_page.dart';
import 'package:edumate/features/courses/pages/comments_page.dart';
import 'package:edumate/features/courses/pages/courses_screen.dart';
import 'package:edumate/features/courses/pages/subject_page.dart';
import 'package:edumate/features/home/pages/daily_schedule_page.dart';
import 'package:edumate/features/home/pages/home_screen.dart';
import 'package:edumate/features/home/pages/notification_page.dart';
import 'package:edumate/features/in/presentation/pages/intro.dart';
import 'package:edumate/features/in/presentation/pages/splash.dart';
import 'package:edumate/features/navigation/pages/ai_page.dart';
import 'package:edumate/features/navigation/pages/nav_main_screen.dart';
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
  static const String schedulescreenPath = '/schedulescreenpath';
  static const String notificationpagePath = '/notificationpagepath';
  static const String coursesscreenPath = '/coursesscreenpath';
  static const String navimainscreenpath = '/navimainscreenpath';
  static const String aipagePath = '/aipagepath';
  static const String subjectpagePath = '/subjectpagepath';
  static const String commentpagePath = '/commentpagepath';
  static const String assignmentdetailspagePath = '/assignmentdetailspagepath';
  static const String splashscreenPath = '/splashscreenpath';

  // names
  static const String intro = 'intro';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String forgetPassword = 'forgetPassword';
  static const String verification = 'verification';
  static const String resetPassword = 'resetPassword';
  static const String homescreen = 'home';
  static const String schedulescreen = 'scheduleschreen';
  static const String notificationpage = 'notificationpage';
  static const String coursesscreenpage = 'coursesscreenpage';
  static const String navimainscreen = 'navimainscreen';
  static const String aipage = 'aipage';
  static const String subjectpage = 'subjectpage';
  static const String commentpage = 'commentpage';
  static const String assignmentdetailspage = 'assignmentdetailspage';
  static const String splashscreen = 'splashscreen';
  

  static GoRouter getRouter(bool isLoggedIn, String uid) {
    return GoRouter(
      initialLocation: splashscreenPath,
      //subjectpagePath,
      // aipagePath,
      debugLogDiagnostics: true,
      routes: [
          GoRoute(
          path: splashscreenPath,
          name: splashscreen,
          builder: (context, state) => SplashScreen(),
        ),
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
        GoRoute(
          path: resetPasswordPath,
          name: resetPassword,
          builder: (context, state) => ResetPassword(),
        ),
        GoRoute(
          path: navimainscreenpath,
          name: navimainscreen,
          builder: (context, state) => NavMainScreen(),
        ),
        GoRoute(
          path: homescreenPath,
          name: homescreen,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: schedulescreenPath,
          name: schedulescreen,
          builder: (context, state) => DailySchedulePage(),
        ),
        GoRoute(
          path: notificationpagePath,
          name: notificationpage,
          builder: (context, state) => NotificationPage(),
        ),
        GoRoute(
          path: coursesscreenPath,
          name: coursesscreenpage,
          builder: (context, state) => CoursesScreen(),
        ),
        GoRoute(
          path: aipagePath,
          name: aipage,
          builder: (context, state) => AIPage(),
        ),
         GoRoute(
          path: subjectpagePath,
          name: subjectpage,
          builder: (context, state) => SubjectPage(),
        ),
                 GoRoute(
          path: commentpagePath,
          name: commentpage,
          builder: (context, state) => CommentsPage(),
        ),
            GoRoute(
          path: assignmentdetailspagePath,
          name: assignmentdetailspage,
          builder: (context, state) => AssignmentDetailsPage(),
        ),
      ],
    );
  }
}
