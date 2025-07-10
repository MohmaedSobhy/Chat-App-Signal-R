import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class ShowToastMessage {
  static void showErrorToastMessage(
    BuildContext context, {
    required String message,
  }) {
    toastification.show(
      context: context,
      backgroundColor: Colors.red,
      type: const ToastificationType.custom("error", Colors.white, Icons.close),
      title: Text(message, style: const TextStyle(color: Colors.white)),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  static void showSucessToastMessage(
    BuildContext context, {
    required String message,
  }) {
    toastification.show(
      context: context,
      type: const ToastificationType.custom(
        "success",
        Colors.white,
        Icons.check,
      ),
      backgroundColor: Colors.green,
      title: Text(message, style: const TextStyle(color: Colors.white)),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
}
