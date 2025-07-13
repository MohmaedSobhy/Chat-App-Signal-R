abstract class MessageModel {
  final int messageId;
  final String senderId;
  final String receiverId;
  final DateTime time;
  final bool isRead;

  const MessageModel({
    this.messageId = 0,
    required this.senderId,
    required this.receiverId,

    required this.time,
    this.isRead = false,
  });
}
