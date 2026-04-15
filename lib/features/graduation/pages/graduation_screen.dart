import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/features/graduation/widgets/tap_switch.dart';
import 'package:edumate/features/graduation/widgets/team_card.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class GraduationScreen extends StatelessWidget {
  const GraduationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Graduation',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: ConstVariebles.fullpadding10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabSwitcher(),
            SizedBox(height: 20),
            Text(
              'Discover Teams',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder:
                    (context, index) => const TeamCard(
                      status: 'OPEN',
                      title: 'AI-Driven Personalized Learning Path',
                      subtitle: 'Predictive diagnostics using Neural network.',
                      members: 4,
                      total: 6,
                      isJoined: false,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
