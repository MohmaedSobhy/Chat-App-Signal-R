import 'package:chat_app/Feature/chat/data/model/message_model.dart';

class TextMessageModel extends MessageModel {
  final String text;

  TextMessageModel({
    required super.messageId,
    required super.isSendByMe,
    required super.type,
    required this.text,
  });

  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      messageId: json['id'] as int,
      isSendByMe: false,
      type: json['senderId'] as String,
      text: json['receiverId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'isSendByMe': isSendByMe,
      'type': type,
      'text': text,
    };
  }
}
