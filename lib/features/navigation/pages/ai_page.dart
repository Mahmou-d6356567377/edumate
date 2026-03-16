import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/navigation/widgets/ai_response_msg.dart';
import 'package:edumate/features/navigation/widgets/custom_text_field_sender.dart';
import 'package:edumate/features/navigation/widgets/my_msg_prompt.dart';
import 'package:flutter/material.dart';

class AIPage extends StatelessWidget {
  const AIPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('EduMate chats')),
      drawer: Drawer(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Chat 1'),
              onTap: () {
                // Handle chat selection
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyMsgPromptWidget(
              width: width,
              title: 'Summaries the first lecture on oop?',
            ),
            AiResponseMsgWidget(width: width),
            Spacer(),
            CustomTextFieldAndSender(controller: _controller),
          ],
        ),
      ),
    );
  }
}
