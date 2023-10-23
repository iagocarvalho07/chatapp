import 'dart:async';
import 'dart:math';

import 'package:chatapp/models/chat_massage.dart';
import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msg = [];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStrem = Stream<List<ChatMessage>>.multi((controler) {
    _controller = controler;
  });

  @override
  Stream<List<ChatMessage>> messagesStrem() {
    return _msgsStrem;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMsg = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );
    _msg.add(newMsg);
    _controller?.add(_msg);
    return newMsg;
  }
}
