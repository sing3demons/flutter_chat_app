import 'package:flutter/material.dart';
import 'package:flutter_chat_app/custom_ui/custom_card.dart';
import 'package:flutter_chat_app/model/chat_model.dart';
import 'package:flutter_chat_app/screens/select_contact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: 'Dev stack',
        icon: 'person.svg',
        isGroup: false,
        time: '5:00',
        currentMessage: 'Hi Everyone'),
    ChatModel(
        name: 'Qa stack',
        icon: 'person.svg',
        isGroup: false,
        time: '5:10',
        currentMessage: 'Hi dev'),
    ChatModel(
        name: 'SA stack',
        icon: 'person.svg',
        isGroup: true,
        time: '6:00',
        currentMessage: 'Hi dev, qa')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact())),
          child: const Icon(Icons.chat)),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(chatModel: chats[index])),
    );
  }
}
