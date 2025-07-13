import 'package:chat_app/Feature/chat/data/model/message_model.dart';

class TextMessageModel extends MessageModel {
  final String text;

  TextMessageModel({
    required super.messageId,
    required super.senderId,
    required super.receiverId,
    required super.isRead,
    required super.time,
    required this.text,
  });

  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      messageId: json['id'] as int,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      isRead: json['isRead'] as bool,
      time: DateTime.parse(json['time'] as String),
      text: json['text'] as String,
    );
  }
}
