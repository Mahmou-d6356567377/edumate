import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/home/widgets/daily_schedule_item.dart';
import 'package:edumate/features/home/widgets/double_texted_row_widget.dart';
import 'package:edumate/features/home/widgets/home_calendar.dart';
import 'package:edumate/features/home/widgets/home_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: Column(
          spacing: 20,
          children: [
            SafeArea(child: HomeScreenHeader(username: 'Mohamed')),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration:
                            Theme.of(context).brightness == Brightness.light
                                ? ConstContainerDecorations.whiteshadow(context)
                                : ConstContainerDecorations.darkmodeshadow(
                                  context,
                                ),
                        child: HomeCalendar(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DoubleTextedRowWidget(
                      title1: 'Daily Schedule',
                      title2: 'View all',
                      onTap2: () {
                        GoRouter.of(context).push(GoRoutes.schedulescreenPath);
                      },
                    ),
                  ),
                  SliverList.builder(
                    itemBuilder: (context, index) => DailyScheduleItem(),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
