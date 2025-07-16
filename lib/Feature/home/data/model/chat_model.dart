class ChatModel {
  int chatId;
  String senderId;
  String lastMessage;
  int unReaded;
  String usrName;
  DateTime date;

  ChatModel({
    required this.chatId,
    required this.senderId,
    required this.lastMessage,
    required this.unReaded,
    required this.usrName,
    required this.date,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chatId'],
      senderId: json['senderId'],
      lastMessage: json['lastMessage'],
      unReaded: json['unReaded'],
      usrName: json['usrName'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'senderId': senderId,
      'lastMessage': lastMessage,
      'unReaded': unReaded,
      'usrName': usrName,
      'date': date.toIso8601String(),
    };
  }
}
