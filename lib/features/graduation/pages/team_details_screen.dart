import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/subject_card_shimmer.dart';
import 'package:edumate/features/graduation/cubits/getteamdetails/getteamdetails_cubit.dart';
import 'package:edumate/features/graduation/widgets/project_info_card.dart';
import 'package:edumate/features/graduation/widgets/team_member_card.dart';
import 'package:edumate/features/graduation/widgets/team_supervisor_cards.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TeamDetailsScreen extends StatelessWidget {
  const TeamDetailsScreen({super.key});

  final bool isadmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Team Details',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(ConstsColors.kblue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text('Request', style: Fonts.boldwhitestyle16),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<GetteamdetailsCubit, GetteamdetailsState>(
        builder: (context, state) {
          if (state is GetteamdetailsFailure) {
            return Center(child: Text(state.message));
          }
          if (state is GetteamdetailsSuccess) {
            final instructors = state.teamDetails.instructors ?? [];

            // 👇 split by role
            final doctors =
                instructors
                    .where((i) => (i.role ?? '').toLowerCase() == 'doctor')
                    .toList();
            final tas =
                instructors
                    .where((i) => (i.role ?? '').toLowerCase() == 'ta')
                    .toList();

            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ProjectInfoCard(
                      status: state.teamDetails.status ?? 'unknown',
                      membersCount: state.teamDetails.membersCount ?? 0,
                      totalMembers: state.teamDetails.maxMembers ?? 0,
                      title: state.teamDetails.name ?? 'unknown name',
                      description:
                          state.teamDetails.description ??
                          'unknown description',
                    );
                  }, childCount: 1),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: Text('Team Members', style: Fonts.boldblackstyle18),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 12)),
                SliverList.builder(
                  itemBuilder: (context, index) {
                    return TeamMemberCard(
                      name:
                          state.teamDetails.members?[index].studentName ??
                          'Unknown',
                      role: state.teamDetails.members?[index].role ?? 'Unknown',
                      uid:
                          state.teamDetails.members?[index].studentId ??
                          'Unknown',
                    );
                  },
                  itemCount: state.teamDetails.members?.length ?? 0,
                ),

                SliverToBoxAdapter(child: const SizedBox(height: 24)),

                // 👇 Doctors section,
                SliverToBoxAdapter(
                  child: const Text(
                    'Doctor',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                if (doctors.isNotEmpty) ...[
                  SliverToBoxAdapter(child: const SizedBox(height: 12)),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return TeamSupervisorCard(
                        imageUrl: 'https://i.pravatar.cc/300?img=15',
                        name: doctors[index].name ?? 'Unknown',
                        specialization: doctors[index].role ?? '',
                        onChatTap: () {},
                      );
                    },
                    itemCount: doctors.length,
                  ),
                  SliverToBoxAdapter(child: const SizedBox(height: 24)),
                ] else ...[
                  SliverToBoxAdapter(child: SubjectCardShimmer()),
                ],
                SliverToBoxAdapter(
                  child: const Text(
                    'Teaching Assistant',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                // 👇 TAs section
                if (tas.isNotEmpty) ...[
                  SliverToBoxAdapter(child: const SizedBox(height: 12)),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return TeamSupervisorCard(
                        imageUrl: 'https://i.pravatar.cc/300?img=20',
                        name: tas[index].name ?? 'Unknown',
                        specialization: tas[index].role ?? '',
                        onChatTap: () {},
                      );
                    },
                    itemCount: tas.length,
                  ),
                  SliverToBoxAdapter(child: const SizedBox(height: 24)),
                ] else ...[
                  SliverToBoxAdapter(child: SubjectCardShimmer()),
                ],

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(ConstsColors.kred),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Constants.leaveicon),
                          SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 10,
                            ),
                            child: Text('Leave', style: Fonts.boldwhitestyle16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
