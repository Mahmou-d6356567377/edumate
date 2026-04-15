import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/attendence/pages/attendence_screen.dart';
import 'package:edumate/features/attendence/pages/qr_scanner.dart';
import 'package:edumate/features/courses/pages/class_work_page.dart';
import 'package:edumate/features/courses/pages/peaple_page.dart';
import 'package:edumate/features/courses/pages/stream_page.dart';
import 'package:edumate/features/courses/widgets/ai_floating_action_button.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final List<Widget> _screens = [
    StreamPage(),
    ClassWorkPage(),
    PeaplePage(),
    QRScannerScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Big Data'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Stack(
          children: [
            _screens[_selectedIndex],

            AIFloatingActionButton(),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: deviceWidth * 0.9,
                  height: 80,
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Constants.stream,
                              colorFilter: ColorFilter.mode(
                                _selectedIndex == 0
                                    ? Color(ConstsColors.kblue)
                                    : Colors.grey,
                                BlendMode.srcIn,
                              ),
                              width: _selectedIndex == 0 ? 35 : 25,
                              height: _selectedIndex == 0 ? 35 : 25,
                            ),

                            Text(
                              'Stream',
                              style:
                                  _selectedIndex == 0
                                      ? Fonts.normalbluestyle14
                                      : Fonts.normalgreystyle,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Constants.classwork,
                              colorFilter: ColorFilter.mode(
                                _selectedIndex == 1
                                    ? Color(ConstsColors.kblue)
                                    : Colors.grey,
                                BlendMode.srcIn,
                              ),
                              width: _selectedIndex == 1 ? 35 : 25,
                              height: _selectedIndex == 1 ? 35 : 25,
                            ),

                            Text(
                              'Classwork',
                              style:
                                  _selectedIndex == 1
                                      ? Fonts.normalbluestyle14
                                      : Fonts.normalgreystyle,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Constants.users,
                              colorFilter: ColorFilter.mode(
                                _selectedIndex == 2
                                    ? Color(ConstsColors.kblue)
                                    : Colors.grey,
                                BlendMode.srcIn,
                              ),
                              width: _selectedIndex == 2 ? 35 : 25,
                              height: _selectedIndex == 2 ? 35 : 25,
                            ),

                            Text(
                              'Users',
                              style:
                                  _selectedIndex == 2
                                      ? Fonts.normalbluestyle14
                                      : Fonts.normalgreystyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
