import 'package:edumate/features/attendence/pages/attendence_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR")),
      body: MobileScanner(
        onDetect: (result) {
          final code = result.barcodes.first.rawValue;
          print(code);
           if (code != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => AttendanceScreen(qrData: code),
              ),
            );
          }
        },
      ),
    );
  }
}         