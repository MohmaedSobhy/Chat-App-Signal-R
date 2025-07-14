class UserTypingModel {
  final String userId;
  final bool isTyping;

  UserTypingModel({required this.userId, required this.isTyping});

  factory UserTypingModel.fromJson(Map<String, dynamic> json) {
    return UserTypingModel(
      userId: json['userId'] as String,
      isTyping: json['isTyping'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'isTyping': isTyping};
  }
}
