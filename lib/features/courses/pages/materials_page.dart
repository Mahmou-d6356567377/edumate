
import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/utils/course_dummy_data.dart';
import 'package:edumate/features/courses/widgets/class_work_search_bar.dart';
import 'package:edumate/features/courses/widgets/material_item.dart';
import 'package:edumate/features/courses/widgets/recent_file_list_tile.dart';
import 'package:edumate/features/courses/widgets/upload_option.dart';
import 'package:flutter/material.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController controller = TextEditingController();
    final folders = CourseDummyData.materialFolders;

    return Padding(
      padding: ConstVariebles.edgeInsets,
      child: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: folders.length,
            itemBuilder: (context, index) {
              final folder = folders[index];
              return MaterialItem(
                folder: folder,
                onTap: () {
                  // Show the files inside this folder
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (context) => SizedBox.expand(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              folder.title,
                              style: Fonts.boldblackstyle16,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: folder.fileCount,
                              itemBuilder: (context, i) => RecentFileListTile(
                                file: RecentFileModel(
                                  title: '${folder.title} – File ${i + 1}',
                                  url: 'drive.google.com/file-${i + 1}',
                                  uploadedAt: 'Oct ${i + 1}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),

          // FAB
          Positioned(
            bottom: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Folder name', style: Fonts.boldblackstyle16),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 15.0),
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
                            const Icon(Icons.create_new_folder),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          UploadOption(
                                            icon: Icons.upload_file,
                                            text: 'Upload file',
                                          ),
                                          UploadOption(
                                            icon: Icons.drive_folder_upload,
                                            text: 'Add from drive',
                                          ),
                                          UploadOption(
                                            icon: Icons.camera_alt,
                                            text: 'Take Photo',
                                          ),
                                          UploadOption(
                                            icon: Icons.videocam,
                                            text: 'Record video',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Add attachment',
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
                          child: const Text(
                            '+ Create',
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
                child: const Icon(Icons.add_card, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
