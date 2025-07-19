class ChatModel {
  int chatId;
  String senderId;
  String lastMessage;
  int unReaded;
  String title;
  DateTime date;

  ChatModel({
    required this.chatId,
    required this.senderId,
    required this.lastMessage,
    required this.unReaded,
    required this.title,
    required this.date,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chatId'],
      senderId: json['senderId'],
      lastMessage: json['lastMessage'],
      unReaded: json['unReaded'],
      title: json['title'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'senderId': senderId,
      'lastMessage': lastMessage,
      'unReaded': unReaded,
      'usrName': title,
      'date': date.toIso8601String(),
    };
  }
}
