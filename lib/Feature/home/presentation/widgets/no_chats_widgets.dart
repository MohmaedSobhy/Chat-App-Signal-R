import 'package:flutter/material.dart';

class NoChatsWidgets extends StatelessWidget {
  const NoChatsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat, size: 100, color: Theme.of(context).primaryColor),
          const Text(
            "No recent chats",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
