import 'package:chat_app/Feature/home/data/model/chat_model.dart';
import 'package:chat_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';

class ChatListTileWidget extends StatelessWidget {
  final ChatModel chatModel;
  const ChatListTileWidget({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.chatScreen, arguments: chatModel);
      },
      leading: CircleAvatar(
        backgroundColor: Theme.of(
          context,
        ).primaryColor.withAlpha((0.1 * 255).toInt()),
        child: Text(chatModel.usrName[0].toUpperCase()),
      ),
      title: Text(
        chatModel.usrName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              chatModel.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
