import 'package:chat_app/core/services/connections_services.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/services/secure_storage.dart';

class UserChatApp {
  static bool isAuthorized = false;

  static Future<void> userIsAuthorized() async {
    String? token = await GetItServices.getIt<SecureStorage>().getUserToken();
    isAuthorized = (token != null);

    if (isAuthorized) {
      await ConnectionsServices.initConnection();
    }
  }
}
