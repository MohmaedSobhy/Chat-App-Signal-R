import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/chat/data/model/message_model.dart';
import 'package:chat_app/Feature/chat/data/model/send_message_model.dart';
import 'package:chat_app/Feature/chat/data/model/text_message_model.dart';
import 'package:chat_app/core/services/connections_services.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:signalr_netcore/hub_connection.dart';

part 'chat_messages_state.dart';

class ChatMessagesCubit extends Cubit<ChatMessagesState> {
  ChatMessagesCubit() : super(ChatMessagesInitial());
  TextEditingController textEditingController = TextEditingController();

  List<MessageModel> messages = [];

  void sendTextMessage(String receiverId) {
    log("The reciever id is ${receiverId}");

    if (ConnectionsServices.connection.state != HubConnectionState.Connected) {
      log(
        "Connection is not established. Current state: ${ConnectionsServices.connection.state}",
      );
      return;
    }
    SendMessageModel sendMessageModel = SendMessageModel(
      recieverId: receiverId,
      text: textEditingController.text.toString(),
    );
    ConnectionsServices.connection.invoke(
      "sendmessagetouser",
      args: [sendMessageModel.toJson()],
    );
  }

  void listenToMessages() {
    ConnectionsServices.connection.on("ReceiveMessage", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final data = arguments[0];
        if (data is Map<String, dynamic>) {
          final message = TextMessageModel.fromJson(data);
          messages.add(message);
          emit(ChatMessageAdd());
        }
      }
    });
  }
}
