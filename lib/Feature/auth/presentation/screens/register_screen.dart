import 'package:chat_app/Feature/auth/presentation/views/register_screen_body_view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: RegisterScreenBodyView(),
      ),
    );
  }
}
