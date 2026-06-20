import 'package:edumate/config/env/vid.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/services/service_locator.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/cubits/getsubmesseges/getsubmesseges_cubit.dart';
import 'package:edumate/features/courses/data/models/subItemtosubdetailModel.dart';
import 'package:edumate/features/courses/data/repo/course_repo.dart';
import 'package:edumate/features/courses/pages/class_work_page.dart';
import 'package:edumate/features/courses/pages/peaple_page.dart';
import 'package:edumate/features/courses/pages/stream_page.dart';
import 'package:edumate/features/courses/widgets/ai_floating_action_button.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key, required this.subitemtosubdetailmodel});

  final Subitemtosubdetailmodel subitemtosubdetailmodel;

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  late final List<Widget> _screens;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _screens = [
      BlocProvider(
        create:
            (context) => GetstreammessegesCubit(courseRepo: sl<CourseRepo>())
              ..getStreamMessages(
                courseId: widget.subitemtosubdetailmodel.subId,
              ),
        child: StreamPage(
          subitemtosubdetailmodel: widget.subitemtosubdetailmodel,
        ),
      ),
      ClassWorkPage(subjectid: widget.subitemtosubdetailmodel.subId),
      PeaplePage(subjectid: widget.subitemtosubdetailmodel.subId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.subitemtosubdetailmodel.subname,
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          children: [
            _screens[_selectedIndex],

            const AIFloatingActionButton(),

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
                      // Stream
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
                                      : Fonts.normalgreystyle16,
                            ),
                          ],
                        ),
                      ),

                      // Classwork
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      : Fonts.normalgreystyle16,
                            ),
                          ],
                        ),
                      ),

                      // Users
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      : Fonts.normalgreystyle16,
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
