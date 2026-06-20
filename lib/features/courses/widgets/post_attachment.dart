import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

enum AttachmentType { image, pdf, word, drive, other }

class PostAttachment extends StatelessWidget {
  const PostAttachment({super.key, required this.title, required this.fileurl});
  final String title;
  final String fileurl;

  AttachmentType get _type {
    final url = fileurl.toLowerCase();
    if (url.contains('drive.google.com')) return AttachmentType.drive;
    if (url.endsWith('.jpg') ||
        url.endsWith('.jpeg') ||
        url.endsWith('.png') ||
        url.endsWith('.gif'))
      return AttachmentType.image;
    if (url.endsWith('.pdf')) return AttachmentType.pdf;
    if (url.endsWith('.doc') || url.endsWith('.docx'))
      return AttachmentType.word;
    return AttachmentType.other;
  }

  IconData get _icon {
    switch (_type) {
      case AttachmentType.image:
        return Icons.image_outlined;
      case AttachmentType.pdf:
        return Icons.picture_as_pdf_outlined;
      case AttachmentType.word:
        return Icons.description_outlined;
      case AttachmentType.drive:
        return Icons.add_to_drive_outlined;
      case AttachmentType.other:
        return Icons.insert_drive_file_outlined;
    }
  }

  Color get _color {
    switch (_type) {
      case AttachmentType.pdf:
        return Colors.red;
      case AttachmentType.word:
        return Colors.blue;
      case AttachmentType.drive:
        return Colors.green;
      case AttachmentType.image:
        return Colors.purple;
      case AttachmentType.other:
        return Colors.orange;
    }
  }

  // Open image in fullscreen, open others in browser
  void _onTap(BuildContext context) {
    if (_type == AttachmentType.image) {
      showDialog(
        context: context,
        builder:
            (_) => Dialog(
              backgroundColor: Colors.black,
              insetPadding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Center(
                    child: InteractiveViewer(child: Image.network(fileurl)),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
      );
    } else {
      _launchUrl();
    }
  }

  Future<void> _launchUrl() async {
    final uri = Uri.parse(fileurl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _download(BuildContext context) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = fileurl.split('/').last;
      final savePath = '${dir.path}/$fileName';

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Downloading $fileName...')));

      await Dio().download(fileurl, savePath);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Downloaded to $savePath')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Download failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: ConstContainerDecorations.redshadow(context),
        child: IntrinsicWidth(
          child: Row(
            children: [
              Icon(_icon, color: _color, size: 28),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Fonts.normalbluestyle14.copyWith(
                    color: _color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Drive links open externally, no download needed
              if (_type != AttachmentType.drive)
                GestureDetector(
                  onTap: () => _download(context),
                  child: SvgPicture.asset(
                    Constants.downloadicon,
                    width: 18,
                    height: 18,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
