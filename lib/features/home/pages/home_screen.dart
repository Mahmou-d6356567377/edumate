import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/services/service_locator.dart'; // wherever sl() lives
import 'package:edumate/features/courses/widgets/subject_card_shimmer.dart';
import 'package:edumate/features/home/cubits/timeline/timeline_cubit.dart';
import 'package:edumate/features/home/widgets/daily_schedule_item.dart';
import 'package:edumate/features/home/widgets/double_texted_row_widget.dart';
import 'package:edumate/features/home/widgets/home_calendar.dart';
import 'package:edumate/features/home/widgets/home_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TimelineCubit>(),
      child: Builder(
        builder: (context) {
          // 👈 this context is a descendant of BlocProvider, safe to use context.read here
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 20,
              ),
              child: Column(
                spacing: 20,
                children: [
                  SafeArea(child: HomeScreenHeader()),
                  Expanded(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Container(
                              decoration:
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ConstContainerDecorations.whiteshadow(
                                        context,
                                      )
                                      : ConstContainerDecorations.darkmodeshadow(
                                        context,
                                      ),
                              child: HomeCalendar(
                                onDaySelected: (date) {
                                  final formatted = DateFormat(
                                    'yyyy-MM-dd',
                                  ).format(date);
                                  context.read<TimelineCubit>().getCourses(
                                    date: formatted,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DoubleTextedRowWidget(
                            title1: 'Daily Schedule',
                            title2: 'View all',
                            onTap2: () {
                              GoRouter.of(
                                context,
                              ).push(GoRoutes.schedulescreenPath);
                            },
                          ),
                        ),
                        BlocBuilder<TimelineCubit, TimelineState>(
                          builder: (context, state) {
                            if (state is TimelineLoading ||
                                state is TimelineInitial) {
                              return SliverList.builder(
                                itemBuilder:
                                    (context, index) =>
                                        const SubjectCardShimmer(),
                                itemCount: 3, // placeholder/shimmer count
                              );
                            }

                            if (state is TimelineFailure) {
                              return SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              );
                            }

                            if (state is TimelineSuccess) {
                              if (state.timeline.isEmpty) {
                                return const SliverToBoxAdapter(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 24),
                                    child: Center(
                                      child: Text(
                                        'No classes scheduled for this day.',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return SliverList.builder(
                                itemBuilder: (context, index) {
                                  final item = state.timeline[index];
                                  return DailyScheduleItem(timeLineModel: item);
                                },
                                itemCount: state.timeline.length,
                              );
                            }

                            return const SliverToBoxAdapter(child: SizedBox());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
