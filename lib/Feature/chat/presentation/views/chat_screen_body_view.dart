import 'dart:developer';

import 'package:chat_app/Feature/chat/data/model/text_message_model.dart';
import 'package:chat_app/Feature/chat/presentation/cubit/chat_messages_cubit.dart';
import 'package:chat_app/Feature/chat/presentation/widget/send_message_text_field.dart';
import 'package:chat_app/Feature/chat/presentation/widget/text_message_bubble.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenBodyView extends StatefulWidget {
  final String recieverId;
  const ChatScreenBodyView({super.key, required this.recieverId});

  @override
  State<ChatScreenBodyView> createState() => _ChatScreenBodyViewState();
}

class _ChatScreenBodyViewState extends State<ChatScreenBodyView> {
  late final ChatMessagesCubit chatMessagesCubit;

  @override
  void initState() {
    super.initState();
    chatMessagesCubit = ChatMessagesCubit();

    chatMessagesCubit.listenToMessages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chatMessagesCubit,
      child: Column(
        children: [
          BlocBuilder<ChatMessagesCubit, ChatMessagesState>(
            builder: (context, state) {
              log("the rebuild state is");
              return Expanded(
                child: ListView.builder(
                  itemCount: chatMessagesCubit.messages.length,
                  itemBuilder: (context, index) {
                    return (chatMessagesCubit.messages[index]
                            is TextMessageModel)
                        ? TextMessageBubble(
                          message:
                              chatMessagesCubit.messages[index]
                                  as TextMessageModel,
                          isMe: true,
                        )
                        : const SizedBox();
                  },
                ),
              );
            },
          ),
          SendMessageTextField(
            textEditingController: chatMessagesCubit.textEditingController,
            sendTextMessage: () {
              if (chatMessagesCubit.textEditingController.text.isNotEmpty) {
                chatMessagesCubit.sendTextMessage(widget.recieverId);
              }
            },
            sendAudioMessage: () {},
          ),
        ],
      ),
    );
  }
}
