abstract class MessageModel {
  final int messageId;
  final bool isSendByMe;
  final String type;
  const MessageModel({
    this.messageId = 0,
    required this.isSendByMe,
    required this.type,
  });
}
