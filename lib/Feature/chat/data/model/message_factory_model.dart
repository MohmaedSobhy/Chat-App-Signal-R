import 'package:chat_app/Feature/chat/data/model/audio_message_model.dart';
import 'package:chat_app/Feature/chat/data/model/message_model.dart';

import 'text_message_model.dart';

enum MessageType {
  text,
  audio;

  static MessageType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'text':
        return MessageType.text;
      case 'audio':
        return MessageType.audio;
      default:
        throw Exception('Unknown message type: $type');
    }
  }
}

class MessageFactoryModel {
  static MessageModel createMessage(
    Map<String, dynamic> data,
    MessageType type,
  ) {
    switch (type) {
      case MessageType.text:
        return TextMessageModel.fromJson(data);
      case MessageType.audio:
        return AudioMessageModel.fromJson(data);
    }
  }
}
