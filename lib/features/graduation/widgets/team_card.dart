import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/graduation/widgets/avatar_stack.dart';
import 'package:edumate/features/graduation/widgets/status_badge.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final String status;
  final String title;
  final String subtitle;
  final int members;
  final int total;
  final bool isJoined;
  final bool disabled;

  const TeamCard({
    super.key,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.members,
    required this.total,
    required this.isJoined,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 12),
        height: 200,
        decoration:
            Theme.of(context).brightness == Brightness.light
                ? ConstContainerDecorations.whiteshadow(context)
                : ConstContainerDecorations.darkmodeshadow(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusBadge(status: status),
                Text('$members/$total members'),
              ],
            ),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).brightness == Brightness.light
                ? Fonts.boldblackstyle18
                : Fonts.boldwhitestyle18),
            const SizedBox(height: 6),
            Text(subtitle, style: Theme.of(context).brightness == Brightness.light
                ? Fonts.normalgreystyle14:
                Fonts.normalwhitestyle14),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AvatarStack(),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Details')),
                    ElevatedButton(
                      onPressed: disabled ? null : () {},
                      child: Text(isJoined ? 'Joined' : 'Request to join'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
