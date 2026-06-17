import 'package:edumate/core/services/source_picker_service.dart';
import 'package:edumate/features/courses/data/models/source_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AddSourcesButton extends StatefulWidget {
  final String assetPath;
  final void Function(PickedSourceFile file) onPicked;

  const AddSourcesButton({
    super.key,
    required this.assetPath,
    required this.onPicked,
  });

  @override
  State<AddSourcesButton> createState() => _AddSourcesButtonState();
}

class _AddSourcesButtonState extends State<AddSourcesButton> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final SourcePickerService _pickerService = SourcePickerService();

  void _toggleMenu() {
    _overlayEntry == null ? _openMenu() : _closeMenu();
  }

  void _openMenu() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _closeMenu,
              child: Container(color: Colors.transparent),
            ),
          ),
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 50),
            child: _buildMenuCard(),
          ),
        ],
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildMenuCard() {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: kSourceOptions.map(_buildOptionRow).toList(),
        ),
      ),
    );
  }

  Widget _buildOptionRow(SourceOption option) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _handleSelect(option.type),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFBFD9FE)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(option.icon, color: const Color(0xFF3B82F6), size: 18),
            ),
            const SizedBox(width: 12),
            Text(option.label,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSelect(SourceType type) async {
    _closeMenu();
    PickedSourceFile? file;
    switch (type) {
      case SourceType.photo:
        file = await _pickerService.pickPhoto();
        break;
      case SourceType.image:
        file = await _pickerService.pickImage();
        break;
      case SourceType.file:
        file = await _pickerService.pickFile();
        break;
      case SourceType.drive:
        file = await _pickerService.pickFromDrive();
        break;
    }
    if (file != null) widget.onPicked(file);
  }

  @override
  void dispose() {
    _closeMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleMenu,
        child: SvgPicture.asset(widget.assetPath),
      ),
    );
  }
}