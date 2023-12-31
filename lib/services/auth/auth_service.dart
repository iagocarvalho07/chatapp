import 'dart:io';

import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/services/auth/auth_service_mock.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup(
      String name,
      String email,
      String password,
      File? image,
      );

  Future<void> login(
      String email,
      String password,
      );

  Future<void> logout();

  factory AuthService(){
    return AuthServiceMock();
  }
}
