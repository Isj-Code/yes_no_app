import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://bnetcmsus-a.akamaihd.net/cms/content_folder_media/KHWQ30K48USW1420679499675.jpg'),
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Mi Chat",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.abc_rounded,
              size: 45,
            ),
          ],
        ),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? const OtherMessageBubble()
                      : const MyMessageBubble();
                },
              ),
            ),
            const TextField()
          ],
        ),
      ),
    );
  }
}
