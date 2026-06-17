import 'package:flutter/material.dart';
import 'dart:typed_data';

enum SourceType { photo, image, file, drive }

class SourceOption {
  final SourceType type;
  final String label;
  final IconData icon;
  const SourceOption(this.type, this.label, this.icon);
}

const List<SourceOption> kSourceOptions = [
  SourceOption(SourceType.photo, 'Photo', Icons.camera_alt_outlined),
  SourceOption(SourceType.image, 'Image', Icons.image_outlined),
  SourceOption(SourceType.file, 'file', Icons.insert_drive_file_outlined),
  SourceOption(SourceType.drive, 'Drive', Icons.add_to_drive_outlined),
];

class PickedSourceFile {
  final SourceType type;
  final String name;
  final String? path; // null on web
  final Uint8List? bytes;

  PickedSourceFile({
    required this.type,
    required this.name,
    this.path,
    this.bytes,
  });
}