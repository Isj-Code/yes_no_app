import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola que tal?", fromWho: FromWho.mine),
    Message(text: "Ya llegaste?", fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messageList.add(
      Message(text: text, fromWho: FromWho.mine),
    );

    if (text.endsWith('?')) {
      otherReply();
    }

    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();

    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
