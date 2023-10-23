import 'package:chatapp/models/chat_massage.dart';
import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/services/chat/chat_mock_service.dart';

abstract class ChatService{
  Stream<List<ChatMessage>> messagesStrem();

  Future<ChatMessage> save(String text, ChatUser user, );

  factory ChatService(){
    return ChatMockService();
  }
}