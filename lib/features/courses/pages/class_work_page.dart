
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/utils/course_dummy_data.dart';
import 'package:edumate/features/courses/widgets/class_work_search_bar.dart';
import 'package:edumate/features/courses/widgets/material_asseignment_widget.dart';
import 'package:edumate/features/courses/widgets/recent_file_list_tile.dart';
import 'package:edumate/features/home/widgets/double_texted_row_widget.dart';
import 'package:flutter/material.dart';

class ClassWorkPage extends StatelessWidget {
  const ClassWorkPage({super.key, required this.subjectid});
  final String subjectid;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController controller = TextEditingController();
    final files = CourseDummyData.recentFiles;

    return Padding(
      padding: ConstVariebles.edgeInsets,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomSearchBar(height: height, controller: controller),
          ),
          SliverToBoxAdapter(
            child: MaterialAsseignmentwidgets(height: height),
          ),
          SliverToBoxAdapter(
            child: DoubleTextedRowWidget(
              title1: 'Recent Files',
              title2: 'See all',
              onTap2: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) =>
                              RecentFileListTile(file: files[index]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Show only the 5 most recent files
          SliverList.builder(
            itemCount: files.length,
            itemBuilder: (context, index) =>
                RecentFileListTile(file: files[index]),
          ),
        ],
      ),
    );
  }
}
