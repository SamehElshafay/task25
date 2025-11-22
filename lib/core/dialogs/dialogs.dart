import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:task/core/utils/app_colors.dart';

class AppDialogs {
  AppDialogs._();
  static void showCustomSnackbar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static Future showCenteredSnackbar({
    required BuildContext context,
    required String title,
    required String message,
    required ContentType type,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();

    Color bg;
    if (type == ContentType.success) {
      bg = Colors.green;
    } else if (type == ContentType.failure) {
      bg = AppColors.error;
    } else if (type == ContentType.warning) {
      bg = Colors.orange;
    } else {
      bg = AppColors.primary;
    }

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

    messenger.showSnackBar(snackBar);
  }

  static void showCustomBannerSnackbar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentMaterialBanner();

    final banner = MaterialBanner(
      backgroundColor: AppColors.secondary.withOpacity(0.15),
      elevation: 1,
      leading: const Icon(Icons.info, color: AppColors.primary),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => messenger.hideCurrentMaterialBanner(),
          child: const Text(
            "Close",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );

    messenger.showMaterialBanner(banner);
  }

  static void showCustomYesNoDialog({
    required BuildContext context,
    required Function() onYesClicked,
    required String text,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          "Confirm",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "No",
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              onYesClicked();
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  static void showCustomLoadingDialog(
      BuildContext context, {
        String? message,
      }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColors.primary),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  message ?? "Loading...",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}