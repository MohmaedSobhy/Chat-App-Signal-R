class RegisterRequestModel {
  final String userName;
  final String phone;
  final String password;

  RegisterRequestModel({
    required this.userName,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'userName': userName, 'password': password, 'phoneNumber': phone};
  }
}
