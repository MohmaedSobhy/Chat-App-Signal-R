import 'package:chat_app/Feature/home/data/repo/chat_repository_implmentation.dart';
import 'package:chat_app/Feature/home/presentation/controller/user%20chats/user_chats_cubit.dart';
import 'package:chat_app/Feature/home/presentation/widgets/chat_list_tile_widget.dart';
import 'package:chat_app/Feature/home/presentation/widgets/no_chats_widgets.dart';
import 'package:chat_app/core/services/get_it_services.dart';
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
    userChatsCubit = UserChatsCubit(
      GetItServices.getIt<ChatRepositoryImplmentation>(),
    );

    userChatsCubit.listenToMessages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userChatsCubit..loadAllChats(),
      child: BlocBuilder<UserChatsCubit, UserChatsState>(
        builder: (context, state) {
          if (state is UserChatsInitial || state is LoadingChatsState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (userChatsCubit.chats.isEmpty) {
            return const Center(child: NoChatsWidgets());
          }
          return ListView.builder(
            itemCount: userChatsCubit.chats.length,
            itemBuilder: (contet, index) {
              return ChatListTileWidget(chatModel: userChatsCubit.chats[index]);
            },
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
