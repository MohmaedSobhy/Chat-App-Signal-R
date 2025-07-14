import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/chat/data/model/message_model.dart';
import 'package:chat_app/Feature/chat/data/model/send_message_model.dart';
import 'package:chat_app/Feature/chat/data/model/text_message_model.dart';
import 'package:chat_app/Feature/chat/data/repo/chat_message_repository_implmentation.dart';
import 'package:chat_app/core/services/connections_services.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:signalr_netcore/hub_connection.dart';

part 'chat_messages_state.dart';

class ChatMessagesCubit extends Cubit<ChatMessagesState> {
  final ChatMessageRepositoryImplmentation messagesReposiotry;
  final String reciverId;
  ChatMessagesCubit(this.messagesReposiotry, this.reciverId)
    : super(ChatMessagesInitial());
  TextEditingController textEditingController = TextEditingController();

  List<MessageModel> messages = [];

  Future<void> loadChatMessage() async {
    log("loading cubit");
    emit(LoadingChatMessages());
    var token = await GetItServices.getIt<SecureStorage>().getUserToken();
    var result = await messagesReposiotry.getChatMessages(token!, reciverId);
    log(token.toString());
    result.fold(
      (failure) {
        emit(FailedChatMessages());
      },
      (data) {
        messages.clear();
        messages.addAll(data);
        emit(SuccessChatMessages());
      },
    );
  }

  void sendTextMessage() {
    if (ConnectionsServices.connection.state != HubConnectionState.Connected) {
      log(
        "Connection is not established. Current state: ${ConnectionsServices.connection.state}",
      );
      return;
    }
    SendMessageModel sendMessageModel = SendMessageModel(
      recieverId: reciverId,
      text: textEditingController.text.toString(),
    );
    textEditingController.text = "";
    ConnectionsServices.connection.invoke(
      "sendmessagetouser",
      args: [sendMessageModel.toJson()],
    );
  }

  void listenToMessages() {
    ConnectionsServices.connection.on("ReceiveMessage", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final data = arguments[0];
        log(data.toString());
        if (data is Map<String, dynamic>) {
          final message = TextMessageModel.fromJson(data);
          message.sendByYou = reciverId != message.senderId;
          messages.add(message);
          emit(ChatMessageAdd());
        }
      }
    });
  }
}
