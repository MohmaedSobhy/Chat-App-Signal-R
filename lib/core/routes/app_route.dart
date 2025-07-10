import 'package:chat_app/Feature/auth/presentation/screens/login_screen.dart';
import 'package:chat_app/Feature/auth/presentation/screens/register_screen.dart';
import 'package:chat_app/Feature/chat/data/model/reciver_model.dart';
import 'package:chat_app/Feature/chat/presentation/screens/chat_screen.dart';
import 'package:chat_app/Feature/home/presentation/screens/home_screen.dart';
import 'package:chat_app/core/routes/base_route.dart';
import 'package:flutter/material.dart';

abstract class AppRoute {
  static const String homeScreen = "HomeScreen";
  static const String chatScreen = "ChatScreen";
  static const String loginScreen = "LoginScreen";
  static const String registerScreen = "RegisterScreen";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return BaseRoute(
          pageBuilder: (_, __, ___) {
            return const HomeScreen();
          },
        );
      case chatScreen:
        return BaseRoute(
          pageBuilder:
              (_, __, ___) =>
                  ChatScreen(user: settings.arguments as ReciverModel),
        );
      case loginScreen:
        return BaseRoute(
          pageBuilder: (_, __, ___) {
            return const LoginScreen();
          },
        );
      case registerScreen:
        return BaseRoute(
          pageBuilder: (_, __, ___) {
            return const RegisterScreen();
          },
        );
      default:
        return null;
    }
  }
}
