import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/services/service_locator.dart';
import 'package:edumate/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 0));

    final isLoggedIn = await sl<AuthRepo>().isLoggedIn();
    // final savedToken = await sl<FlutterSecureStorage>().read(key: 'access_token');
    //   final savedRefresh = await sl<FlutterSecureStorage>().read(key: 'refresh_token');
    //   final savedExpiration = await sl<FlutterSecureStorage>().read(key: 'token_expiration');

    //   print('>>> SAVED ACCESS TOKEN: $savedToken');
    //   print('>>> SAVED REFRESH TOKEN: $savedRefresh');
    //   print('>>> SAVED EXPIRATION: $savedExpiration');
    if (!mounted) return; // 🔥 prevents crash
    if (isLoggedIn) {
      GoRouter.of(context).pushReplacementNamed(GoRoutes.navimainscreen);
    } else {
      GoRouter.of(context).pushReplacementNamed(GoRoutes.login);
    }
    // context.go(GoRoutes.navimainscreenpath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // LOGO,
            SvgPicture.asset(Constants.applogo, width: 220),

            const SizedBox(height: 10),

            const Text(
              "Intelligent University Management",
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),

            const Spacer(),

            // PROGRESS INDICATOR
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(),
            ),

            const SizedBox(height: 12),

            const Text(
              "Version 2.0.1",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
