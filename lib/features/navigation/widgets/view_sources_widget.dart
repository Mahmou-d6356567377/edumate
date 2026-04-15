import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewSourcesWidget extends StatelessWidget {
  const ViewSourcesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAboutDialog(
          context: context,

          children: [
            ListTile(
              leading: SvgPicture.asset(
                Constants.sourceicon,
                width: 30,
                height: 30,
              ),
              title: Text('Source 1', style: Fonts.normalblackstyle18),
              subtitle: Text('www.example.com', style: Fonts.normalgreystyle),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(ConstsColors.kblue),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                Constants.sourceicon,
                width: 30,
                height: 30,
              ),
              title: Text('Source 2', style: Fonts.normalblackstyle18),
              subtitle: Text('Page 4 • Definition', style: Fonts.normalgreystyle),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(ConstsColors.kblue),
              ),
            ),
          ],
        );
      },
      child: Row(
        children: [
          SvgPicture.asset(Constants.viewsources, width: 25, height: 25),
          SizedBox(width: 10),
          Text(
            'View sources',
            style: Fonts.normalbluestyle14.copyWith(
              color: Color(ConstsColors.kblue),
            ),
          ),
        ],
      ),
    );
  }
}
