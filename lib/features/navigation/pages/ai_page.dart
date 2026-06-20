import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/navigation/cubits/addchat/addchat_cubit.dart';
import 'package:edumate/features/navigation/cubits/askai/askai_cubit.dart';
import 'package:edumate/features/navigation/cubits/getallchats/getallchats_cubit.dart';
import 'package:edumate/features/navigation/widgets/ai_response_msg.dart';
import 'package:edumate/features/navigation/widgets/custom_text_field_sender.dart';
import 'package:edumate/features/navigation/widgets/my_msg_prompt.dart';
import 'package:edumate/features/navigation/widgets/new_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AIPage extends StatelessWidget {
  const AIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController aicontroller = TextEditingController();
    final TextEditingController drawercontroller = TextEditingController();
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(title: const Text('EduMate chats')),
      drawer: Drawer(
        backgroundColor: const Color(0xFFf7f9fd),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
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
              const CustomNewChat(),
              Text(
                'Chats',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.grey),
              ),

              // ✅ GetAllChats state
              BlocBuilder<GetAllChatsCubit, GetAllChatsState>(
                builder: (context, state) {
                  if (state is GetAllChatsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetAllChatsSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.chats.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                // TODO: navigate to specific chat
                              },
                              child: Text(
                                state.chats[index].name ??
                                    'Chat ${index + 1}', // 👈 use your model field
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GetAllChatsFailure) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<AskAICubit, AskAIState>(
                  builder: (context, state) {
                    if (state is AskAILoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is AskAISuccess) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            MyMsgPromptWidget(
                              width: width,
                              title: state.question,
                            ),
                            AiResponseMsgWidget(
                              width: width,
                              response: state.response,
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),

              BlocBuilder<AddChatCubit, AddChatState>(
                builder: (context, state) {
                  final chatId = state is AddChatSuccess ? state.chatId : null;

                  return CustomTextFieldAndSender(
                    controller: aicontroller,
                    onSend:
                        chatId == null
                            ? null
                            : () {
                              final question = aicontroller.text.trim();

                              if (question.isEmpty) return;

                              context.read<AskAICubit>().askAI(
                                chatId: chatId,
                                message: question,
                              );

                              aicontroller.clear();
                            },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
