import 'package:chat_app/Feature/chat/data/model/text_message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextMessageBubble extends StatelessWidget {
  final TextMessageModel message;
  final bool isMe;
  const TextMessageBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isMe ? 64 : 8,
          right: isMe ? 8 : 64,
          bottom: 4,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isMe
                  ? Theme.of(context).primaryColor
                  : Theme.of(
                    context,
                  ).primaryColor.withAlpha((0.1 * 255).toInt()),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat('h:mm a').format(message.time),
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 14,
                    color: (message.isRead) ? Colors.red : Colors.grey,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
