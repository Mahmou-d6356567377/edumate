import 'package:edumate/config/env/vid.dart';
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/data/models/subItemtosubdetailModel.dart';
import 'package:edumate/features/home/data/models/time_line_model/time_line_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DailyScheduleItem extends StatelessWidget {
  const DailyScheduleItem({super.key, required this.timeLineModel});
  final TimeLineModel timeLineModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          GoRoutes.subjectpagePath,
          extra: Subitemtosubdetailmodel(
            subId:timeLineModel.sessionId!,
            subname: timeLineModel.courseName!,
            subpic: timeLineModel.imageUrl!,
          ),
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(bottom: 12, left: 5, right: 5),
        decoration:
            Theme.of(context).brightness == Brightness.light
                ? ConstContainerDecorations.whiteshadow(context)
                : ConstContainerDecorations.darkmodeshadow(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                '${VidConsts.apiBaseURL}${timeLineModel.imageUrl}',
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timeLineModel.courseName??'Unknown',
                    style:
                        Theme.of(context).brightness == Brightness.light
                            ? Fonts.boldblackstyle16
                            : Fonts.boldwhitestyle16,
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          timeLineModel.instructorName??'Unknown',
                          style: Fonts.normalgreystyle14,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      SvgPicture.asset(Constants.clock),

                      Text(
                        ' ${timeLineModel.startTime} - ${timeLineModel.endTime} ',
                        style: Fonts.normalgreystyle12,
                      ),
                      Text('${timeLineModel.location}', style: Fonts.normalbluestyle12),
                    ],
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
