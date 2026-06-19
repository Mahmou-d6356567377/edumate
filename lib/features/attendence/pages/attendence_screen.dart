import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/core/widgets/custom_txt_field2.dart';
import 'package:edumate/features/attendence/cubit/attendance_cubit_cubit.dart';
import 'package:edumate/features/attendence/cubit/attendance_cubit_state.dart';
import 'package:edumate/features/attendence/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AttendanceView();
  }
}

class _AttendanceView extends StatefulWidget {
  const _AttendanceView();

  @override
  State<_AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<_AttendanceView> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AttendanceCubit>().checkLocation();
  }

  // ✅ Open scanner and wait for result
  Future<void> _scanQR() async {
    final cubit = context.read<AttendanceCubit>();
    final token = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const QRScannerScreen()),
    );
    if (token != null) {
      cubit.setQr(token); // ✅ set token on return
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AttendanceCubit, AttendanceState>(
          listener: (context, state) {
            if (state is AttendanceSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is AttendanceError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<AttendanceCubit>();

            final isLoading = state is AttendanceLoading;
            final hasPosition = cubit.currentPosition != null;
            final hasQr = cubit.qrData != null; // ✅ track if QR scanned

            // ✅ Ready to submit once we have both a QR scan and a device
            // position. The server validates whether that position is
            // actually within range of the class.
            final isReady = hasQr && hasPosition;

            return Column(
              children: [
                CustomTextField(
                  hintText: "Name",
                  controller: _nameController,
                  prefixIcon: Constants.user,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: _emailController,
                  prefixIcon: Constants.email,
                  hintText: "Email",
                ),
                const SizedBox(height: 20),

                // ✅ QR Status + Scan Button
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: hasQr ? Colors.green[100] : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        hasQr ? Icons.qr_code_2 : Icons.qr_code_scanner,
                        color: hasQr ? Colors.green : Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          hasQr ? "QR Scanned ✅" : "QR code required",
                          style: Fonts.normalgreystyle12.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _scanQR,
                        child: Text(
                          hasQr ? "Re-scan" : "Scan",
                          style: Fonts.normalbluestyle12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // ✅ Location Status — only confirms we *have* a position.
                // Proximity to the class is validated server-side now.
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: hasPosition ? Colors.green[100] : Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(hasPosition ? Icons.check_circle : Icons.warning),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          hasPosition
                              ? "Location Captured ✅"
                              : "Location access required to mark attendance",
                          style: Fonts.normalgreystyle12.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      if (!hasPosition)
                        TextButton(
                          onPressed: () => cubit.checkLocation(),
                          child: const Text(
                            "Enable",
                            style: Fonts.normalbluestyle12,
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        isReady && !isLoading
                            ? () => cubit.attendenceComfirmation()
                            : null,
                    child:
                        isLoading
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