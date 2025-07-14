import 'package:chat_app/Feature/chat/presentation/controller/user%20status/user_status_cubit.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/repo/chat_message_repository_implmentation.dart';

class UserNetworkStateView extends StatefulWidget {
  final String userName;
  final String senderId;
  const UserNetworkStateView({
    super.key,
    required this.userName,
    required this.senderId,
  });

  @override
  State<UserNetworkStateView> createState() => _UserNetworkStateViewState();
}

class _UserNetworkStateViewState extends State<UserNetworkStateView> {
  late final UserStatusCubit userStatus;
  @override
  void initState() {
    super.initState();
    userStatus = UserStatusCubit(
      widget.senderId,
      GetItServices.getIt<ChatMessageRepositoryImplmentation>(),
    );
    userStatus.listenToUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userStatus..getUserStatus(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(
              context,
            ).primaryColor.withAlpha((255 * 0.1).toInt()),
            child: Text(widget.userName[0].toUpperCase()),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userName),

              BlocBuilder<UserStatusCubit, UserStatusState>(
                builder: (context, state) {
                  if (state is UserTypingStatus) {
                    return Text(
                      "typing...",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    );
                  }
                  if (state is UserOnlineStatus) {
                    return const Text(
                      "Online",
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    );
                  }
                  if (state is UserLastSeenStatus) {
                    return Text(
                      "seen at ${DateFormat('h:mm a').format(state.time)}",
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userStatus.close();
    super.dispose();
  }
}
