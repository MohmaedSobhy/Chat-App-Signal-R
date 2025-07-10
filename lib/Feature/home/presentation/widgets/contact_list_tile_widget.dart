import 'package:chat_app/Feature/chat/data/model/reciver_model.dart';
import 'package:chat_app/Feature/home/data/model/contact_model.dart';
import 'package:chat_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';

class ContactListTileWidget extends StatelessWidget {
  final ContactModel contact;
  const ContactListTileWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(
          context,
        ).primaryColor.withAlpha((255 * 0.1).toInt()),
        child: Text(contact.userName[0].toUpperCase()),
      ),
      title: Text(contact.userName),
      onTap: () async {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(
          AppRoute.chatScreen,
          arguments: ReciverModel(name: contact.userName, id: contact.userId),
        );
      },
    );
  }
}
