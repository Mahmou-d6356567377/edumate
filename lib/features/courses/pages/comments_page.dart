import 'package:edumate/features/courses/widgets/comment_list_tile.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:edumate/features/navigation/widgets/custom_text_field_sender.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final commentcontroller = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(title: 'Comments'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => CommentListTile(),
                itemCount: 10,
              ),
            ),
            CustomTextFieldAndSender(controller: commentcontroller),
          ],
        ),
      ),
    );
  }
}
