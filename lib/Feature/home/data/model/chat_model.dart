class ChatModel {
  final String senderId;
  final String senderName;
  final String lastMessage;

  ChatModel({
    required this.senderId,
    required this.senderName,
    required this.lastMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      lastMessage: json['lastMessage'] as String,
    );
  }
}
