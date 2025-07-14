class UserStatusModel {
  final String userId;
  final String state;

  UserStatusModel({required this.userId, required this.state});

  factory UserStatusModel.fromJson(Map<String, dynamic> json) {
    return UserStatusModel(
      userId: json['userId'] as String,
      state: json['state'] as String,
    );
  }
}
