import 'dart:io';

import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/services/auth/auth_service.dart';

class AuthServiceMock implements AuthService{
  @override
  // TODO: implement currentUser
  ChatUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> singUp(String name, String email, String password, File image) {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement userChange
  Stream<ChatUser?> get userChange => throw UnimplementedError();

}