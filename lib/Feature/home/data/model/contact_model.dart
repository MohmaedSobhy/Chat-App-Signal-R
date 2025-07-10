class ContactModel {
  final String userId;
  final String phone;
  final String userName;
  ContactModel({
    required this.userId,
    required this.phone,
    required this.userName,
  });
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      userId: json['id'] as String,
      phone: json['phone'] as String,
      userName: json['userName'] as String,
    );
  }
}
