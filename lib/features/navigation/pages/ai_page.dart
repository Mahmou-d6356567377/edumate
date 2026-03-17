import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/navigation/widgets/ai_response_msg.dart';
import 'package:edumate/features/navigation/widgets/custom_text_field_sender.dart';
import 'package:edumate/features/navigation/widgets/my_msg_prompt.dart';
import 'package:edumate/features/navigation/widgets/new_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AIPage extends StatelessWidget {
  const AIPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController aicontroller = TextEditingController();
    TextEditingController drawercontroller = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('EduMate chats')),
      drawer: Drawer(
        backgroundColor: Color(0xFFf7f9fd),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              TextFormField(
                controller: drawercontroller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(ConstsColors.kwhite),
                ),
              ),

              CustomNewChat(),
              Text(
                'Chats',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.grey),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle chat selection
                        },

                        child: Text(
                          'Summarize the first lecture on oop?',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
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
            CustomTextFieldAndSender(controller: aicontroller),
          ],
        ),
      ),
    );
  }
}
