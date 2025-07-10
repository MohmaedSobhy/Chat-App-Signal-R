import 'package:flutter/material.dart';

import '../views/login_screen_body_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LoginScreenBodyView(),
      ),
    );
  }
}
