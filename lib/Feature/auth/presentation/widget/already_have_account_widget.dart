import 'package:chat_app/core/routes/app_route.dart';
import 'package:chat_app/core/utils/app_string.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: RichText(
          text: TextSpan(
            text: AppString.alreadyHaveAccount,
            style: TextStyle(color: Colors.grey[600]),
            children: [
              TextSpan(
                text: AppString.login,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoute.loginScreen);
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
