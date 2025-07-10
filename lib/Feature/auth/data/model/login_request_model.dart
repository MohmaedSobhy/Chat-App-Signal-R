class LoginRequestModel {
  final String phone;
  final String password;

  LoginRequestModel({required this.phone, required this.password});

  Map<String, dynamic> toJson() {
    return {'phone': phone, 'password': password};
  }
}
