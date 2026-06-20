import 'package:edumate/features/courses/cubits/getcourses/getcourses_cubit.dart';
import 'package:edumate/features/courses/widgets/subject_card_shimmer.dart';
import 'package:edumate/features/courses/widgets/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key, required this.selected});

  final int selected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetcoursesCubit, GetcoursesState>(
      builder: (context, state) {
        if (state is GetcoursesFailure) {
          return Center(child: Text(state.message));
        } else if (state is GetcoursesSuccess) {
          return Expanded(
            child: ListView.builder(
              itemBuilder:
                  (context, index) => SubjectItemWidget(
                    selected: selected,
                    course: state.courses[index],
                  ),
              itemCount: state.courses.length,
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) => SubjectCardShimmer(),
          itemCount: 10,
        );
      },
    );
  }
}
