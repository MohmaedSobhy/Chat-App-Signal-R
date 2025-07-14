abstract class ApiEndPoints {
  static const String baseUrl = 'https://chatingservices.runasp.net/';
  static const String login = '${baseUrl}api/Account/Login';
  static const String register = '${baseUrl}api/Account/Registerr';
  static const String getAllUsers = '${baseUrl}api/User/GetAllUsers';
  static const String chatServices = "${baseUrl}chatHub?access_token=";
  static const String allChatMessage = "${baseUrl}api/Chat/";
  static const String getUserStatus = "${baseUrl}api/User/GetUserState?UserId=";
}
