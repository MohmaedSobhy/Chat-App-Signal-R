import 'package:chat_app/Feature/chat/data/model/message_model.dart';

class AudioMessageModel extends MessageModel {
  final String audioPath;

  AudioMessageModel({
    required super.messageId,
    required super.senderId,
    required super.receiverId,
    required super.isRead,
    required super.time,
    required this.audioPath,
  });

  factory AudioMessageModel.fromJson(Map<String, dynamic> json) {
    return AudioMessageModel(
      messageId: json['messageId'] as int,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      isRead: json['isRead'] as bool,
      time: DateTime.parse(json['time'] as String),
      audioPath: json['audioPath'] as String,
    );
  }
}
