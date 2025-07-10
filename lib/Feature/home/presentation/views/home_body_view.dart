import 'package:chat_app/Feature/home/data/model/chat_model.dart';
import 'package:chat_app/Feature/home/presentation/controller/user%20chats/user_chats_cubit.dart';
import 'package:chat_app/Feature/home/presentation/widgets/chat_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  late final UserChatsCubit userChatsCubit;

  @override
  void initState() {
    super.initState();
    userChatsCubit = UserChatsCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userChatsCubit,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (contet, index) {
          return ChatListTileWidget(
            chatModel: ChatModel(
              senderId: "1",
              senderName: "Mohamed Sobhy",
              lastMessage: "Ahelo",
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    userChatsCubit.close();
    super.dispose();
  }
}
