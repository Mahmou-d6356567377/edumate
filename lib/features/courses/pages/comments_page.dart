import 'package:edumate/core/services/service_locator.dart';
import 'package:edumate/features/courses/cubits/addcomment/addcomment_cubit.dart';
import 'package:edumate/features/courses/cubits/getcomments/getcomments_cubit.dart';
import 'package:edumate/features/courses/widgets/comment_list_tile.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:edumate/features/navigation/widgets/custom_text_field_sender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key, required this.msgid});
  final String msgid;

  @override
  Widget build(BuildContext context) {
    final commentcontroller = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => sl<GetcommentsCubit>()..getComments(msgId: msgid),
        ),
        BlocProvider(create: (context) => sl<AddcommentCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: 'Comments'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<GetcommentsCubit, GetcommentsState>(
                  builder: (context, state) {
                    if (state is GetcommentsFailure) {
                      return Center(child: Text(state.message));
                    }
                    if (state is GetcommentsSuccess) {
                      if (state.comments.isEmpty) {
                        return Center(
                          child: Text(
                            'No comments yet. Be the first to comment!',
                          ),
                        );
                      }
                      return ListView.builder(
                        itemBuilder:
                            (context, index) => CommentListTile(
                              commentModel: state.comments[index],
                            ),
                        itemCount: state.comments.length,
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              BlocListener<AddcommentCubit, AddcommentState>(
                listener: (context, state) {
                  if (state is AddcommentSuccess) {
                    context.read<GetcommentsCubit>().getComments(msgId: msgid);
                  }
                  if (state is AddcommentFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: Builder(
                  builder:
                      (context) => CustomTextFieldAndSender(
                        controller: commentcontroller,
                        onSend: () {
                          if (commentcontroller.text.trim().isEmpty) return;
                          context.read<AddcommentCubit>().addComment(
                            messageId: msgid,
                            content: commentcontroller.text.trim(),
                          );
                          commentcontroller.clear();
                        },
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
