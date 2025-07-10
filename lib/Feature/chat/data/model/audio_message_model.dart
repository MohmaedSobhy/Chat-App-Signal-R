import 'package:chat_app/Feature/chat/data/model/message_model.dart';

class AudioMessageModel extends MessageModel {
  final String audioPath;

  AudioMessageModel({
    required super.messageId,
    required super.isSendByMe,
    required this.audioPath,
    required super.type,
  });

  factory AudioMessageModel.fromJson(Map<String, dynamic> json) {
    return AudioMessageModel(
      messageId: json['messageId'] as int,
      isSendByMe: json['isSendByMe'] as bool,
      audioPath: json['audioPath'] as String,
      type: json['type'] as String,
    );
  }
}
