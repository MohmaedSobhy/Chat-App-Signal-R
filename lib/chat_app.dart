import 'package:chat_app/app/chat_app.dart';
import 'package:chat_app/core/routes/app_route.dart';
import 'package:chat_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute:
          (UserChatApp.isAuthorized)
              ? AppRoute.homeScreen
              : AppRoute.loginScreen,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
