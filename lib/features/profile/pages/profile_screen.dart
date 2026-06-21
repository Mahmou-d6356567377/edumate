import 'package:edumate/features/profile/data/cubits/profile/profile_cubit.dart';
import 'package:edumate/features/profile/widgets/academic_section.dart';
import 'package:edumate/features/profile/widgets/info_section.dart';
import 'package:edumate/features/profile/widgets/info_tile.dart';
import 'package:edumate/features/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'View Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert, color: Colors.black)],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is ProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('profile loaded successfully')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ProfileHeader(
                  name:
                      state is ProfileSuccess
                          ? state.userProfile.fullName!
                          : 'Loading...',
                  id: state is ProfileSuccess ? state.userProfile.id! : '?',
                  level:
                      state is ProfileSuccess ? state.userProfile.level! : '?',
                ),

                SizedBox(height: 20),
                InfoSection(
                  title: 'Personal Information',
                  children: [
                    InfoTile(
                      icon: Icons.email,
                      title: 'Email Address',
                      value:
                          state is ProfileSuccess
                              ? state.userProfile.email!
                              : 'Loading...',
                    ),
                    InfoTile(
                      icon: Icons.phone,
                      title: 'Phone Number',
                      value:
                          state is ProfileSuccess
                              ? state.userProfile.phoneNumber ??
                                  'There is no phone'
                              : 'Loading...',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AcademicSection(
                  finishedhours:
                      state is ProfileSuccess
                          ? state.userProfile.finishedHours!
                          : 0,
                  gpa: state is ProfileSuccess ? state.userProfile.gpa! : 0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
