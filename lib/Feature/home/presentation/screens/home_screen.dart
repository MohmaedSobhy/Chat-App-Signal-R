import 'package:chat_app/Feature/home/presentation/views/all_contacts_bottom_sheet.dart';
import 'package:chat_app/Feature/home/presentation/views/home_body_view.dart';
import 'package:chat_app/Feature/home/presentation/widgets/alert_logout_dialoge.dart';
import 'package:chat_app/core/utils/app_string.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.chats),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertLogoutDialoge();
                },
              );
            },
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const HomeBodyView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const AllContactsBottomSheet(),
          );
        },
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
