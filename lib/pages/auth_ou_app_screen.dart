import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/pages/auth_screen.dart';
import 'package:chatapp/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import 'chat_screen.dart';

class AuthOrAppScreen extends StatelessWidget {
  const AuthOrAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthScreen();
          }
        },
      ),
    );
  }
}
