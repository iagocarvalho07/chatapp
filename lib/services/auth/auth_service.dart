import 'dart:io';

import 'package:chatapp/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;
  
  Stream<ChatUser?> get userChange;

  Future<void> singUp(
    String name,
    String email,
    String password,
    File image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();
}
