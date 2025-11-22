import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:task/core/dialogs/dialogs.dart';

class DialogService {
  static void showSuccess(BuildContext context, String message) {
    AppDialogs.showCenteredSnackbar(
      context: context,
      title: "Success",
      message: message,
      type: ContentType.success,
    );
  }

  static void showError(BuildContext context, String message) {
    AppDialogs.showCenteredSnackbar(
      context: context,
      title: "Error",
      message: message,
      type: ContentType.failure,
    );
  }

  static void showLoading(BuildContext context, String message) {
    AppDialogs.showCustomLoadingDialog(context, message: message);
  }

  static void hideLoading(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}