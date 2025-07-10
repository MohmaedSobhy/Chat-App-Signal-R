import 'package:flutter/material.dart';

class AlertLogoutDialoge extends StatelessWidget {
  const AlertLogoutDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm Logout"),
      content: const Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: const Text("No"),
        ),
        TextButton(onPressed: () {}, child: const Text("Yes")),
      ],
    );
  }
}
