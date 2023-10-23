import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/pages/auth_screen.dart';
import 'package:chatapp/pages/loading_screen.dart';
import 'package:chatapp/services/auth/auth_service_mock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class AuthOrAppScreen extends StatelessWidget {
  const AuthOrAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<ChatUser?>(
            stream: AuthServiceMock().userChange, builder: (ctx, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return LoadingScreen();
              }else {
                return snapshot.hasData ? ChatPage() : AuthScreen();
              }
        }));
  }
}
