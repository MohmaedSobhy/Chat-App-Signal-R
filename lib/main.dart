import 'package:chat_app/app/chat_app.dart';
import 'package:chat_app/chat_app.dart';
import 'package:chat_app/core/api/dio_services.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetItServices.setup();
  await Future.wait([UserChatApp.userIsAuthorized(), DioService.init()]);

  runApp(const ChatApp());
}
