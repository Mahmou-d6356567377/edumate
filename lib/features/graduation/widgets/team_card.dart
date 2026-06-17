import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/graduation/widgets/avatar_stack.dart';
import 'package:edumate/features/graduation/widgets/status_badge.dart';
import 'package:edumate/features/graduation/widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class TeamCard extends StatelessWidget {
  final String status;
  final String title;
  final String subtitle;
  final int members;
  final int total;
  final bool isRequested;
  final bool disabled;

  const TeamCard({
    super.key,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.members,
    required this.total,
    required this.isRequested,
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
            Text(
              title,
              style:
                  Theme.of(context).brightness == Brightness.light
                      ? Fonts.boldblackstyle18
                      : Fonts.boldwhitestyle18,
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style:
                  Theme.of(context).brightness == Brightness.light
                      ? Fonts.normalgreystyle14
                      : Fonts.normalwhitestyle14,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AvatarStack(),
                Row(
                  children: [
                    TextButton(
                      onPressed:
                          disabled
                              ? null
                              : () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(GoRoutes.teamDetails);
                              },
                      child: Text(
                        'Details',
                        style: Fonts.boldwhitestyle16.copyWith(
                          color: Color(ConstsColors.kblue),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isRequested
                                ? Color(ConstsColors.klightgreen2)
                                : Color(ConstsColors.kblue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed:
                          disabled
                              ? null
                              : () {
                                TopBanner.show(
                                  context,
                                  'Application recorded successfully',
                                );
                                showRequestSentDialog(
                                  context,
                                  onBackToTeams: () {
                                    // e.g. Navigator.pop or refresh the team list
                                  },
                                );
                              },
                      child: Text(
                        isRequested ? 'Request sent' : 'Request to join',
                        style: Fonts.boldwhitestyle16,
                      ),
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

void showRequestSentDialog(
  BuildContext context, {
  VoidCallback? onBackToTeams,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.4),
    builder:
        (context) => Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF2DD9A8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2DD9A8).withOpacity(0.4),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Request Sent!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your request has been sent to the team leader. You'll be notified once they respond.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  Constants.requesttojoinsuccess, // swap for your asset
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onBackToTeams?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E40FF),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Back to Teams',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}
