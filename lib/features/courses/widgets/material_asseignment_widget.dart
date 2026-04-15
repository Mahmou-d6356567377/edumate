import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/features/courses/pages/asssignments_page.dart';
import 'package:edumate/features/courses/pages/materials_page.dart';
import 'package:edumate/features/courses/widgets/classwork_category_widget.dart';
import 'package:edumate/features/courses/widgets/material_item.dart';
import 'package:edumate/features/courses/widgets/recent_file_list_tile.dart';
import 'package:flutter/material.dart';

class MaterialAsseignmentwidgets extends StatelessWidget {
  const MaterialAsseignmentwidgets({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height * 0.2,
      margin: ConstVariebles.virticalpadding20,
      child: Row(
        children: [
          ClassworkCategoryWidget(
            title: 'Material',
            pic: Constants.material,
            itemno: '12',
            onTap: () {
              showBottomSheet(
                context: context,
                builder:
                    (context) => MaterialsPage(),
              );
            },
          ),
          ClassworkCategoryWidget(
            title: 'Assignments',
            pic: Constants.asseignment,
            itemno: '4',
            onTap: () => {
              showBottomSheet(
                context: context,
                builder:
                    (context) => AssignmentsPage(),
              ),
            },
          ),
        ],
      ),
    );
  }
}