import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/assignment_details_widget.dart';
import 'package:edumate/features/courses/widgets/attachment_item.dart';
import 'package:edumate/features/courses/widgets/submit_assignment_sheet.dart';
import 'package:edumate/features/courses/widgets/submit_button.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AssignmentDetailsPage extends StatelessWidget {
  const AssignmentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Assignment Details'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AssignmentDetailsWidget(height: height),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Attachment',
                      style:
                          Theme.of(context).brightness == Brightness.light
                              ? Fonts.boldblackstyle18
                              : Fonts.boldwhitestyle18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 10.0,
                    ),
                    child: AttachmentItem(height: height, width: width),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              height: height * 0.2,
              decoration:
                  Theme.of(context).brightness == Brightness.light
                      ? ConstContainerDecorations.whiteshadow(context)
                      : ConstContainerDecorations.darkmodeshadow(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Submission',
                        style:
                            Theme.of(context).brightness == Brightness.light
                                ? Fonts.boldblackstyle18
                                : Fonts.boldwhitestyle18,
                      ),
                      Container(
                        decoration: ConstContainerDecorations.redshadow(
                          context,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Not Submitted',
                          style: Fonts.normalredstyle14,
                        ),
                      ),
                    ],
                  ),
                  SubmitButton(
                    verticalpadidng: 12.0,
                    horizontalpadding: 35.0,
                    onPressed: () {
                     
                      showSubmitAssignmentSheet(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


void showSubmitAssignmentSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const SubmitAssignmentSheet(),
  );
}
