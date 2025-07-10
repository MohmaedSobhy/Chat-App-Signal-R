import 'package:flutter/material.dart';

class UserNetworkStateView extends StatelessWidget {
  final String userName;
  final String senderId;
  const UserNetworkStateView({
    super.key,
    required this.userName,
    required this.senderId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(
            context,
          ).primaryColor.withAlpha((255 * 0.1).toInt()),
          child: Text(userName[0].toUpperCase()),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName),

            // BlocBuilder<ChatRoomCubit, ChatRoomState>(
            //     builder: (context, state) {
            //   if (state.isReceiverTyping) {
            //     return Text(
            //       "typing...",
            //       style: TextStyle(
            //         color: Colors.grey[600],
            //         fontSize: 12,
            //       ),
            //     );
            //   }
            //   if (state.isReceiverOnline) {
            //     return const Text(
            //       "Online",
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Colors.green,
            //       ),
            //     );
            //   }
            //   if (state.receiverLastSeen != null) {
            //     final lastSeen = state.receiverLastSeen!.toDate();
            //     return Text(
            //       "seen at ${DateFormat('h:mm a').format(lastSeen)}",
            //       maxLines: 2,
            //       style: TextStyle(
            //         color: Colors.grey[600],
            //         fontSize: 12,
            //       ),
            //     );
            //   }
            //   return const SizedBox();
            // }),
          ],
        ),
      ],
    );
  }
}
