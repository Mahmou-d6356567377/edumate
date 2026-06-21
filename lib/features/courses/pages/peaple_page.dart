import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/services/service_locator.dart';
import 'package:edumate/features/courses/cubits/streampeople/streampeople_cubit.dart';
import 'package:edumate/features/courses/widgets/subject_member_item.dart';
import 'package:edumate/features/home/widgets/double_texted_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeaplePage extends StatelessWidget {
  const PeaplePage({super.key, required this.subjectid});
  final String subjectid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<StreampeopleCubit>()..getStreamPeople(courseId: subjectid),
      child: BlocBuilder<StreampeopleCubit, StreampeopleState>(
        builder: (context, state) {
          if (state is StreampeopleLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is StreampeopleFailure) {
            return Center(child: Text(state.message));
          }

          if (state is StreampeopleSuccess) {
            final instructors = state.users.instructors ?? [];
            final students = state.users.students ?? [];

            return Padding(
              padding: ConstVariebles.fullpadding16,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DoubleTextedRowWidget(
                      title1: 'Instructors',
                      title2: '${instructors.length} Members',
                    ),
                  ),
                  SliverList.builder(
                    itemCount: instructors.length,
                    itemBuilder:
                        (context, index) => SubjectMemberItem(
                          name: instructors[index].name ?? 'Unknown',
                          role: instructors[index].role ?? 'Instructor',
                        ),
                  ),
                  SliverToBoxAdapter(
                    child: DoubleTextedRowWidget(
                      title1: 'Students',
                      title2: '${students.length} Classmates',
                    ),
                  ),
                  SliverList.builder(
                    itemCount: students.length,
                    itemBuilder:
                        (context, index) => SubjectMemberItem(
                          name: students[index].name ?? 'Unknown',
                          role: 'Student',
                        ),
                  ),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
