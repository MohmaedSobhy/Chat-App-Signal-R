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
    super.sendByYou,
  });

  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      messageId: json['id'] == null ? 0 : json['id'] as int,
      senderId: json['senderId'] as String,
      receiverId: "hellow",
      isRead: json['isRead'] as bool,
      time: DateTime.parse(json['date'] as String),
      text: json['text'] as String,
      sendByYou: json['sendByYou'] as bool,
    );
  }
}
