import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/attendence/pages/qr_scanner.dart';
import 'package:edumate/features/courses/pages/courses_screen.dart';
import 'package:edumate/features/courses/widgets/ai_floating_action_button.dart';
import 'package:edumate/features/graduation/pages/graduation_screen.dart';
import 'package:edumate/features/home/pages/home_screen.dart';
import 'package:edumate/features/profile/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavMainScreen extends StatefulWidget {
  const NavMainScreen({super.key});

  @override
  _NavMainScreenState createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  int _selectedIndex = 0;

  // List of widgets for each screen (AppBar + Body combined)
  final List<Widget> _screens = [
    HomeScreen(),
    CoursesScreen(),
    QRScannerScreen(),
    GraduationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Display the selected screen
          _screens[_selectedIndex],

          AIFloatingActionButton(),
          // Custom Bottom Navigation Bar
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: deviceWidth * 0.9,
                height: 70,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Color(ConstsColors.kdarkbluegray),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color:
                            _selectedIndex == 0
                                ? Color(ConstsColors.kblue)
                                : Colors.grey,
                        size: _selectedIndex == 0 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        Constants.courses,
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 1
                              ? Color(ConstsColors.kblue)
                              : Colors.grey,
                          BlendMode.srcIn,
                        ),
                        width: _selectedIndex == 1 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        Constants.attendence,
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 2
                              ? Color(ConstsColors.kblue)
                              : Colors.grey,
                          BlendMode.srcIn,
                        ),

                        width: _selectedIndex == 2 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        Constants.graduation,
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 3
                              ? Color(ConstsColors.kblue)
                              : Colors.grey,
                          BlendMode.srcIn,
                        ),
                        width: _selectedIndex == 3 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        Constants.profile,
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 4
                              ? Color(ConstsColors.kblue)
                              : Colors.grey,
                          BlendMode.srcIn,
                        ),
                        width: _selectedIndex == 4 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 4;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
