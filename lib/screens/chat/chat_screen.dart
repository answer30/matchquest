import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MatchQuest/viewmodels/chat_view_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ChatViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: viewModel.scrollController,
              itemCount: viewModel.messages.length,
              itemBuilder: (context, index) {
                final message = viewModel.messages[index];
                return ListTile(
                  title: Align(
                    alignment: message.isMine ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message.isMine ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(message.text),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.textController,
                    decoration: const InputDecoration(
                      hintText: '메시지를 입력하세요',
                    ),
                    onSubmitted: (_) => viewModel.sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: viewModel.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
