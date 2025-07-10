import 'package:chat_app/core/api/api_end_points.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/services/secure_storage.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class ConnectionsServices {
  static late HubConnection connection;

  static Future<void> initConnection() async {
    String? token = await GetItServices.getIt<SecureStorage>().getUserToken();
    if (token == null) return;
    connection =
        HubConnectionBuilder()
            .withUrl(
              "${ApiEndPoints.chatServices}$token",
              options: HttpConnectionOptions(requestTimeout: 5000),
            )
            .withAutomaticReconnect()
            .build();

    await connection
        .start()
        ?.then((value) {
          print("Connection started");
        })
        .catchError((error) {
          print("Error starting connection: $error");
        });

    connection.onclose(({error}) {
      print("Connection closed${error != null ? ': $error' : ''}");
      // Optional: Try reconnecting or alert the user
    });
  }

  static void onConnectionClosed() {
    connection.onclose(({error}) {
      print("Connection closed${error != null ? ': $error' : ''}");
    });
  }
}
