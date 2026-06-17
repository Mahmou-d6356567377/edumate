import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/graduation/widgets/project_info_card.dart';
import 'package:edumate/features/graduation/widgets/team_member_card.dart';
import 'package:edumate/features/graduation/widgets/team_supervisor_cards.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const ProjectInfoCard(
                status: 'OPEN',
                membersCount: 4,
                totalMembers: 6,
                title: 'AI-Driven Personalized Learning Path',
                description:
                    'Developing a platform that uses machine learning to adapt educational content based on individual student performance and learning style.',
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
                imageUrl: 'https://i.pravatar.cc/150?img=12',
                name: 'Mohamed Mohsen',
                role: 'UI&UX',
                isLeader: true,
              );
            },
            itemCount: 3,
          ),

          SliverToBoxAdapter(child: const SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: const Text(
              'Supervisor',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 12)),
          SliverList.builder(
            itemBuilder: (context, index) {
              return TeamSupervisorCard(
                imageUrl: 'https://i.pravatar.cc/300?img=15',
                name: 'Dr. Sarah Jenkins',
                specialization: 'Machine Learning',
                onChatTap: () {},
              );
            },
            itemCount: 1,
          ),

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
      ),
    );
  }
}
