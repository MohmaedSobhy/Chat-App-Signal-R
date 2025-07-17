class SendMessageModel {
  final String text;
  final String recieverId;

  SendMessageModel({required this.text, required this.recieverId});

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      text: json['text'] as String,
      recieverId: json['recieverId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'receiverId': recieverId, "chatId": 0};
  }
}
