import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMine;

  ChatMessage({required this.text, required this.isMine});
}

class ChatViewModel extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<ChatMessage> get messages => _messages;

  void sendMessage() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    _messages.add(ChatMessage(text: text, isMine: true));
    textController.clear();
    notifyListeners();

    // 간단한 AI 응답 예시
    Future.delayed(const Duration(milliseconds: 300), () {
      _messages.add(ChatMessage(text: '응답: $text', isMine: false));
      notifyListeners();

      // 맨 아래로 스크롤
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 60,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
