import 'package:chat_app/Feature/chat/data/model/reciver_model.dart';
import 'package:chat_app/Feature/chat/presentation/views/chat_screen_body_view.dart';
import 'package:chat_app/Feature/chat/presentation/views/user_network_state_view.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final ReciverModel user;
  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserNetworkStateView(senderId: user.id, userName: user.name),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ChatScreenBodyView(recieverId: user.id),
      ),
    );
  }
}
