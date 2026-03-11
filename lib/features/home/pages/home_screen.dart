import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/fonts/fonts.dart';
import 'package:edumate/features/home/widgets/daily_schedule_item.dart';
import 'package:edumate/features/home/widgets/home_calendar.dart';
import 'package:edumate/features/home/widgets/home_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          spacing: 20,
          children: [
            SafeArea(child: HomeScreenHeader(username: 'Mohamed')),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
              
                  SliverToBoxAdapter(
                    child: Container(
                      decoration:
                          ConstContainerDecorations.kContainerDecorationShadow,
                      child: HomeCalendar(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Daily Schedule', style: Fonts.boldblackstyle18),
                          Text('View all', style: Fonts.normalbluestyle14),
                        ],
                      ),
                    ),
                  ),
                  SliverList.builder(itemBuilder:   (context, index) => DailyScheduleItem(), itemCount: 10),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
