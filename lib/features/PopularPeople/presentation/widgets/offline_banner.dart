import 'package:flutter/material.dart';
import 'package:task/core/utils/app_colors.dart';

class OfflineBanner extends StatelessWidget {
  final String lastUpdated;
  const OfflineBanner({super.key, required this.lastUpdated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: AppColors.error.withOpacity(0.8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'OFFLINE MODE',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.surface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Showing cached data - last updated: $lastUpdated',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.surface.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}