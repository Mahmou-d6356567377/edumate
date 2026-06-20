import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SubjectCardShimmer extends StatelessWidget {
  const SubjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            // Image Placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Badge
                  Row(
                    children: [
                      Container(width: 120, height: 20, color: Colors.white),
                      const SizedBox(width: 8),
                      Container(
                        width: 60,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Container(width: 140, height: 16, color: Colors.white),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Arrow Placeholder
            Container(width: 20, height: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
