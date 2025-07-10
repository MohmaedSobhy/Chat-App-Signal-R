class UserModel {
  final String token;
  final String userName;

  final String phone;
  UserModel({required this.token, required this.userName, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] as String,
      userName: json['userName'] as String,
      phone: json['phoneNumber'] as String,
    );
  }
}
