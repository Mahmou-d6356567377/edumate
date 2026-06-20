import 'package:edumate/features/courses/cubits/getsubmesseges/getsubmesseges_cubit.dart';
import 'package:edumate/features/courses/data/models/subItemtosubdetailModel.dart';
import 'package:edumate/features/courses/widgets/add_and_send_attachment.dart';
import 'package:edumate/features/courses/widgets/subject_pic.dart';
import 'package:edumate/features/courses/widgets/subject_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key, required this.subitemtosubdetailmodel});
  final Subitemtosubdetailmodel subitemtosubdetailmodel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ClassPic(pic: subitemtosubdetailmodel.subpic),
        ),
        SliverToBoxAdapter(child: AddAndSendAttachment()),
        BlocBuilder<GetstreammessegesCubit, GetstreammessegesState>(
          builder: (context, state) {
            if (state is GetStreammessegesFailure) {
              return SliverToBoxAdapter(child: Text(state.message));
            }
            if (state is GetStreammessegesSuccess) {
              return SliverList.builder(
                itemBuilder:
                    (context, index) => SubjectPostWidget(
                      streamMessage: state.streamMessages[index],
                    ),
                itemCount: state.streamMessages.length,
              );
            }
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }
}
