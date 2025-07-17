import 'dart:developer';

import 'package:chat_app/Feature/chat/data/model/text_message_model.dart';
import 'package:chat_app/Feature/chat/data/model/user_typing_model.dart';
import 'package:chat_app/Feature/chat/data/repo/chat_message_repository_implmentation.dart';
import 'package:chat_app/Feature/chat/presentation/controller/chat%20messages/chat_messages_cubit.dart';
import 'package:chat_app/Feature/chat/presentation/widget/send_message_text_field.dart';
import 'package:chat_app/Feature/chat/presentation/widget/text_message_bubble.dart';
import 'package:chat_app/core/services/get_it_services.dart';

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
  bool isTyping = false;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    chatMessagesCubit = ChatMessagesCubit(
      GetItServices.getIt<ChatMessageRepositoryImplmentation>(),
      widget.recieverId,
    );

    chatMessagesCubit.listenToMessages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chatMessagesCubit..loadChatMessage(),
      child: Column(
        children: [
          BlocBuilder<ChatMessagesCubit, ChatMessagesState>(
            builder: (context, state) {
              scrollToBottom();
              if (state is ChatMessagesInitial ||
                  state is LoadingChatMessages) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: chatMessagesCubit.messages.length,
                  itemBuilder: (context, index) {
                    return (chatMessagesCubit.messages[index]
                            is TextMessageModel)
                        ? TextMessageBubble(
                          message:
                              chatMessagesCubit.messages[index]
                                  as TextMessageModel,
                          isMe: chatMessagesCubit.messages[index].sendByYou,
                        )
                        : const SizedBox();
                  },
                ),
              );
            },
          ),
          SendMessageTextField(
            textEditingController: chatMessagesCubit.textEditingController,
            onChanged: (value) {
              if (value.toString().isEmpty) {
                isTyping = false;
                chatMessagesCubit.sendYouTyping(
                  UserTypingModel(userId: widget.recieverId, isTyping: false),
                );
                return;
              }
              if (value.toString().isNotEmpty && !isTyping) {
                chatMessagesCubit.sendYouTyping(
                  UserTypingModel(userId: widget.recieverId, isTyping: true),
                );
                isTyping = true;
              }
            },
            sendTextMessage: () {
              if (chatMessagesCubit.textEditingController.text.isNotEmpty) {
                chatMessagesCubit.sendTextMessage();
              }
            },
            sendAudioMessage: () {},
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    log("close cubit");
    super.dispose();
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.jumpTo(
          controller.position.maxScrollExtent,
          // duration: const Duration(milliseconds: 150),
          // curve: Curves.easeOut,
        );
      }
    });
  }
}
