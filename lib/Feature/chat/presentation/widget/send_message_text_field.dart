import 'package:flutter/material.dart';

class SendMessageTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final VoidCallback sendTextMessage;
  final VoidCallback sendAudioMessage;
  final ValueChanged<String>? onChanged;
  const SendMessageTextField({
    super.key,
    required this.textEditingController,
    required this.sendAudioMessage,
    required this.sendTextMessage,
    this.onChanged,
  });

  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.textEditingController,
            onChanged: widget.onChanged,
            decoration: const InputDecoration(
              hintText: 'Type a message',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: widget.sendTextMessage,
        ),
        IconButton(
          icon: Icon(Icons.mic, color: Theme.of(context).primaryColor),
          onPressed: widget.sendAudioMessage,
        ),
      ],
    );
  }
}
