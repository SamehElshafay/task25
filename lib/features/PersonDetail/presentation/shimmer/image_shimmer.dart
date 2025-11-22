import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PersonImagesShimmer extends StatelessWidget {
  const PersonImagesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const int crossAxisCount = 3;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Shimmer(
        color: Colors.grey[800]!,
        colorOpacity: 0.5,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}