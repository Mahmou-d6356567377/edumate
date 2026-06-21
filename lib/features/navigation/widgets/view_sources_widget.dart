import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewSourcesWidget extends StatelessWidget {
  const ViewSourcesWidget({super.key, required this.sources});
  final List<String> sources;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text('Sources', style: Fonts.boldblackstyle18),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sources.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.asset(
                        Constants.sourceicon,
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        sources[index],
                        style: Fonts.normalblackstyle18,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(ConstsColors.kblue),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Close',
                    style: Fonts.normalbluestyle14.copyWith(
                      color: Color(ConstsColors.kblue),
                    ),
                  ),
                ),
              ],
            );
          },
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
