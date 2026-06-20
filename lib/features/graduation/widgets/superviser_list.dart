import 'package:edumate/features/graduation/cubits/doctor_cubit/doctor_cubit.dart';
import 'package:edumate/features/graduation/cubits/instructor_cubit/instructor_cubit.dart';
import 'package:edumate/features/graduation/widgets/superviser_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuperviserList extends StatelessWidget {
  const SuperviserList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Doctors Title
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Doctors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        /// Doctors List
        BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is DoctorLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }

            if (state is DoctorFailure) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Failed to load doctors: ${state.message}'),
                  ),
                ),
              );
            }

            if (state is DoctorSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final doctor = state.doctors[index];

                  return SupervisorCard(
                    name: doctor.fullName ?? '',
                    department: doctor.email ?? '',
                    facultyId: doctor.instuctorId.toString(),
                    status: SupervisorStatus.active,
                    onChatTap: () {},
                  );
                }, childCount: state.doctors.length),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),

        /// Teaching Assistants Title
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Teaching Assistants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        /// Instructors List
        BlocBuilder<InstructorCubit, InstructorState>(
          builder: (context, state) {
            if (state is InstructorLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }

            if (state is InstructorFailure) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Failed to load instructors: ${state.message}'),
                  ),
                ),
              );
            }

            if (state is InstructorSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final instructor = state.instructors[index];

                  return SupervisorCard(
                    name: instructor.fullName ?? '',
                    department: instructor.email ?? '',
                    facultyId: instructor.instuctorId.toString(),
                    status: SupervisorStatus.active,
                    onChatTap: () {},
                  );
                }, childCount: state.instructors.length),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),

        SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }
}
