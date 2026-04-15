import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/courses/widgets/class_work_search_bar.dart';
import 'package:edumate/features/courses/widgets/upload_option.dart';
import 'package:edumate/features/courses/widgets/material_item.dart';
import 'package:edumate/features/courses/widgets/recent_file_list_tile.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: ConstVariebles.edgeInsets,
      child: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder:
                (context, index) => MaterialItem(
                  title: 'lec 1',
                  pic: Constants.material,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder:
                          (context) => SizedBox.expand(
                            child: ListView.builder(
                              itemBuilder:
                                  (context, index) => RecentFileListTile(),
                              itemCount: 10,
                            ),
                          ),
                    );
                  },
                ),
            itemCount: 10,
          ),

          Positioned(
            bottom: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder:
                      (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('folder name', style: Fonts.boldblackstyle16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                              ),
                              child: CustomSearchBar(
                                height: height,
                                controller: controller,
                                hintText: 'folder name',
                                icon: Icons.folder_open_rounded,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.create_new_folder),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                  ),
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize
                                                        .min, // ✅ VERY IMPORTANT
                                                children: [
                                                  UploadOption(
                                                    icon: Icons.upload_file,
                                                    text: "Upload file",
                                                  ),
                                                  UploadOption(
                                                    icon:
                                                        Icons
                                                            .drive_folder_upload,
                                                    text: "Add from drive",
                                                  ),
                                                  UploadOption(
                                                    icon: Icons.camera_alt,
                                                    text: "Take Photo",
                                                  ),
                                                  UploadOption(
                                                    icon: Icons.videocam,
                                                    text: "Record video",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    );
                                  },
                                  child: Text(
                                    'add attachment',
                                    style: Fonts.normalbluestyle14,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(ConstsColors.kblue),
                              ),
                              onPressed: () {},
                              child: Text(
                                '+ create',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                );
              },

              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(ConstsColors.kblue),
                child: Icon(Icons.add_card),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
