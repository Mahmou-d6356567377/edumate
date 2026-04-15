
import 'package:edumate/features/courses/widgets/add_and_send_attachment.dart';
import 'package:edumate/features/courses/widgets/subject_pic.dart';
import 'package:edumate/features/courses/widgets/subject_post.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: ClassPic()),
        SliverToBoxAdapter(child: AddAndSendAttachment()),
        SliverList.builder(itemBuilder: (context, index) => SubjectPostWidget(),itemCount: 10,)
      ],
    );
  }
}