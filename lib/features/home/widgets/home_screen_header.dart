import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/fonts/fonts.dart';
import 'package:edumate/features/home/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: Fonts.normalgreystyle),
            Text('${username}! 👋', style: Fonts.headingStyle),
          ],
        ),
       Row(
         children: [
           CustomCircleAvatar(imagePath:  Constants.notificationon, onTap: (){
            GoRouter.of(context).push(GoRoutes.notificationpagePath);
           },),
           
       CustomCircleAvatar(imagePath:  Constants.moon),
         ],
       ),
      ],
    );
  }
}

