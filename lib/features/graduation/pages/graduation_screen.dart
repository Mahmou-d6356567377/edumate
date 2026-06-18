import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/graduation/widgets/superviser_list.dart';
import 'package:edumate/features/graduation/widgets/tap_switch.dart';
import 'package:edumate/features/graduation/widgets/team_card.dart';
import 'package:edumate/features/graduation/widgets/teams_list.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class GraduationScreen extends StatefulWidget {
  const GraduationScreen({super.key});

  @override
  State<GraduationScreen> createState() => _GraduationScreenState();
}

class _GraduationScreenState extends State<GraduationScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Graduation',
        isBack: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: SvgPicture.asset(Constants.search),
          ),
        ],
      ),
      body: Padding(
        padding: ConstVariebles.fullpadding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabSwitcher(
              selectedIndex: _selectedTab,
              onChanged: (index) => setState(() => _selectedTab = index),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    _selectedTab == 0 ? 'Discover Teams' : 'Supervisors',
                    key: ValueKey(_selectedTab),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(GoRoutes.createteamscreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(ConstsColors.kblue),
                    shape: CircleBorder(),
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child:
                    _selectedTab == 0
                        ? const TeamsList()
                        : const SuperviserList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
