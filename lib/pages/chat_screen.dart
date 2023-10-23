import 'package:chatapp/components/new_message.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Chat App Iago"),
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                  value: "logout",
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sair")
                      ],
                    ),
                  ))
            ],
            onChanged: (value) {
              if (value == "logout") {
                AuthService().logout();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Messagens(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
