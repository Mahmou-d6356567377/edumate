import 'package:edumate/features/attendence/cubit/attendance_cubit_cubit.dart';
import 'package:edumate/features/attendence/cubit/attendance_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AttendanceScreen extends StatelessWidget {
  final String qrData;

  const AttendanceScreen({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceCubit()..setQr(qrData),
      child: const _AttendanceView(),
    );
  }
}

class _AttendanceView extends StatelessWidget {
  const _AttendanceView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AttendanceCubit, AttendanceState>(
          listener: (context, state) {
            if (state is AttendanceSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Submitted ✅")),
              );
            } else if (state is AttendanceError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<AttendanceCubit>();

            bool isLoading = state is AttendanceLoading;
            bool isReady = false;
            bool isLocationValid = false;

            if (state is AttendanceReady) {
              isLocationValid = state.isLocationValid;
              isReady = state.isLocationValid &&
                  state.qrData != null;
            }

            return Column(
              children: [
                /// Name
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                /// Email
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                /// Location Status
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isLocationValid
                        ? Colors.green[100]
                        : Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isLocationValid
                            ? Icons.check_circle
                            : Icons.warning,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          isLocationValid
                              ? "Location Verified ✅"
                              : "Location required",
                        ),
                      ),
                      if (!isLocationValid)
                        TextButton(
                          onPressed: () =>
                              cubit.checkLocation(),
                          child: const Text("Enable"),
                        )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isReady
                        ? () => cubit.submit()
                        : null,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text("Submit"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}