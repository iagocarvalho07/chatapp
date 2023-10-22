import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/services/auth/auth_service.dart';

class AuthServiceMock implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStreem = Stream<ChatUser?>.multi((p0) {
    _controller = p0;
    _updateUser(null);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    return _updateUser(null);
  }

  @override
  Future<void> singUp(
      String name, String email, String password, File image) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageUrl: image.path,
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  // TODO: implement userChange
  Stream<ChatUser?> get userChange {
    return _userStreem;
  }

  static void _updateUser(ChatUser? user) {
    _controller = null;
    _controller?.add(_currentUser);
  }
}
